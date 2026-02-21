import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school_demo_by_yasser_ashraf/core/l10n/app_localizations.dart';

import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/l10n/l10n_helper.dart';
import '../../data/models/models.dart';
import '../progress/progress_provider.dart';
import 'quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  final Quiz quiz;
  const QuizScreen({super.key, required this.quiz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  final Map<int, int> _answers = {};
  late PageController _pageController;

  // Timer
  int _secondsRemaining = AppConstants.quizTimeLimitSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining <= 0) {
        timer.cancel();
        _submitQuiz(autoSubmitted: true);
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  String _formatTime(int secs) {
    final m = secs ~/ 60;
    final s = secs % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  double get _timerProgress =>
      _secondsRemaining / AppConstants.quizTimeLimitSeconds;

  Color get _timerColor {
    if (_secondsRemaining <= 60) return AppColors.error;
    if (_secondsRemaining <= 180) return AppColors.warning;
    return AppColors.success;
  }

  void _selectAnswer(int questionIndex, int answerIndex) {
    setState(() => _answers[questionIndex] = answerIndex);
  }

  void _nextQuestion() {
    if (_currentIndex < widget.quiz.questions.length - 1) {
      setState(() => _currentIndex++);
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousQuestion() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _submitQuiz({bool autoSubmitted = false}) async {
    _timer?.cancel();
    final questions = widget.quiz.questions;
    int correctCount = 0;
    final selectedList = <int>[];

    for (int i = 0; i < questions.length; i++) {
      final selected = _answers[i] ?? -1;
      selectedList.add(selected);
      if (selected == questions[i].correctOptionIndex) {
        correctCount++;
      }
    }

    final secondsElapsed =
        AppConstants.quizTimeLimitSeconds - _secondsRemaining;

    await context.read<ProgressProvider>().saveQuizAttempt(
      widget.quiz.id,
      correctCount,
      questions.length,
      selectedList,
    );

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => QuizResultScreen(
          quiz: widget.quiz,
          selectedAnswers: selectedList,
          correctCount: correctCount,
          secondsElapsed: secondsElapsed,
          totalSeconds: AppConstants.quizTimeLimitSeconds,
          wasAutoSubmitted: autoSubmitted,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final questions = widget.quiz.questions;
    final isLastQuestion = _currentIndex == questions.length - 1;
    final allAnswered = _answers.length == questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(L10nHelper.resolve(context, widget.quiz.titleKey)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
            child: Column(
              children: [
                // Timer bar
                Row(
                  children: [
                    Icon(Icons.timer_outlined, size: 18, color: _timerColor),
                    const SizedBox(width: 6),
                    Text(
                      _formatTime(_secondsRemaining),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: _timerColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: _timerProgress,
                          backgroundColor: _timerColor.withValues(alpha: 0.15),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _timerColor,
                          ),
                          minHeight: 6,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Question counter & progress dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.question(_currentIndex + 1),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      ' / ${questions.length}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(questions.length, (i) {
                    final isAnswered = _answers.containsKey(i);
                    final isCurrent = i == _currentIndex;
                    return Container(
                      width: isCurrent ? 24 : 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: isCurrent
                            ? AppColors.primary
                            : isAnswered
                            ? AppColors.primary.withValues(alpha: 0.4)
                            : AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        onPageChanged: (i) => setState(() => _currentIndex = i),
        itemBuilder: (context, index) {
          final question = questions[index];
          return _buildQuestionView(context, question, index);
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              if (_currentIndex > 0)
                Expanded(
                  child: OutlinedButton(
                    onPressed: _previousQuestion,
                    child: Text(l10n.previous),
                  ),
                ),
              if (_currentIndex > 0) const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: _answers.containsKey(_currentIndex)
                      ? isLastQuestion
                            ? allAnswered
                                  ? _submitQuiz
                                  : null
                            : _nextQuestion
                      : null,
                  style: isLastQuestion && allAnswered
                      ? ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                        )
                      : null,
                  child: Text(isLastQuestion ? l10n.submitQuiz : l10n.next),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionView(
    BuildContext context,
    Question question,
    int qIndex,
  ) {
    final options = question.optionKeys;
    final selected = _answers[qIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            L10nHelper.resolve(context, question.textKey),
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ...List.generate(options.length, (i) {
            final isSelected = selected == i;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () => _selectAnswer(qIndex, i),
                borderRadius: BorderRadius.circular(14),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary.withValues(alpha: 0.08)
                        : Theme.of(context).cardTheme.color ?? Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.grey.shade200,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey.shade200,
                          border: isSelected
                              ? null
                              : Border.all(color: Colors.grey.shade300),
                        ),
                        child: Center(
                          child: isSelected
                              ? const Icon(Icons.check, color: Colors.white)
                              : Text(
                                  String.fromCharCode(65 + i),
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          L10nHelper.resolve(context, options[i]),
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
