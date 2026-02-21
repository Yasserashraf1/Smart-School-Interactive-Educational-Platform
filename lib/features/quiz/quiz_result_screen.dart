import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:smart_school_demo_by_yasser_ashraf/core/l10n/app_localizations.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/l10n/l10n_helper.dart';
import '../../data/models/models.dart';
import '../../core/gamification/gamification_provider.dart';
import '../gamification/badge_unlock_dialog.dart';

class QuizResultScreen extends StatefulWidget {
  final Quiz quiz;
  final List<int> selectedAnswers;
  final int correctCount;
  final int secondsElapsed;
  final int totalSeconds;
  final bool wasAutoSubmitted;

  const QuizResultScreen({
    super.key,
    required this.quiz,
    required this.selectedAnswers,
    required this.correctCount,
    required this.secondsElapsed,
    required this.totalSeconds,
    this.wasAutoSubmitted = false,
  });

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _animController;
  late Animation<double> _scoreAnimation;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _scoreAnimation = Tween<double>(
      begin: 0,
      end: _scorePercent,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));

    _animController.forward();
    if (_passed) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) _confettiController.play();
      });
    }

    // Gamification Logic
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final gamification = context.read<GamificationProvider>();

      // Award XP
      int xp = 10; // Participation
      if (_passed) xp += 100;
      if (_scorePercent == 1.0) xp += 50;
      await gamification.addXp(xp);

      if (!mounted) return;
      final l10n = AppLocalizations.of(context)!;

      // Check Badges
      if (_passed) {
        if (await gamification.unlockBadge(
          GamificationProvider.badgeQuizPassed,
        )) {
          if (!mounted) return;
          await BadgeUnlockDialog.show(
            context,
            badgeName: l10n.badgeQuizPassed,
            badgeDescription: l10n.badgeQuizPassedDesc,
            emoji: '✅',
          );
        }
      }

      if (_scorePercent == 1.0) {
        if (await gamification.unlockBadge(
          GamificationProvider.badgeQuizMaster,
        )) {
          if (!mounted) return;
          await BadgeUnlockDialog.show(
            context,
            badgeName: l10n.badgeQuizMaster,
            badgeDescription: l10n.badgeQuizMasterDesc,
            emoji: '🏆',
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _animController.dispose();
    super.dispose();
  }

  double get _scorePercent =>
      widget.correctCount / widget.quiz.questions.length;
  bool get _passed => _scorePercent >= AppConstants.quizPassThreshold;

  /// Speed bonus: up to 20% based on how fast the quiz was completed
  double get _speedBonus {
    if (widget.totalSeconds <= 0) return 0;
    final timeRemaining = widget.totalSeconds - widget.secondsElapsed;
    return (timeRemaining / widget.totalSeconds) * AppConstants.maxSpeedBonus;
  }

  String _formatTime(int secs) {
    final m = secs ~/ 60;
    final s = secs % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final questions = widget.quiz.questions;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: Text(l10n.quizResults),
                  automaticallyImplyLeading: false,
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Auto-submitted warning
                      if (widget.wasAutoSubmitted) ...[
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.warning.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.warning.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.timer_off_rounded,
                                color: AppColors.warning,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  l10n.autoSubmitted,
                                  style: const TextStyle(
                                    color: AppColors.warning,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Score card
                      _buildScoreCard(context, l10n),
                      const SizedBox(height: 16),

                      // Time & Speed card
                      _buildTimeCard(context, l10n),
                      const SizedBox(height: 24),

                      // Action buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(l10n.retryQuiz),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(l10n.backToSubject),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Detailed review
                      Text(
                        l10n.explanation,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 12),

                      ...List.generate(questions.length, (i) {
                        return _buildQuestionReview(
                          context,
                          l10n,
                          questions[i],
                          i,
                        );
                      }),
                      const SizedBox(height: 40),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          // Confetti
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                AppColors.primary,
                AppColors.secondary,
                AppColors.gold,
                AppColors.success,
                Colors.orange,
                Colors.purple,
              ],
              numberOfParticles: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreCard(BuildContext context, AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Emoji
            Text(_passed ? '🎉' : '📚', style: const TextStyle(fontSize: 56)),
            const SizedBox(height: 16),
            // Passed/Failed
            Text(
              _passed ? l10n.passed : l10n.failed,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: _passed ? AppColors.success : AppColors.warning,
              ),
            ),
            const SizedBox(height: 20),
            // Animated score
            AnimatedBuilder(
              animation: _scoreAnimation,
              builder: (context, _) {
                return CircularPercentIndicator(
                  radius: 60,
                  lineWidth: 10,
                  percent: _scoreAnimation.value.clamp(0.0, 1.0),
                  center: Text(
                    '${(_scoreAnimation.value * 100).round()}%',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _passed ? AppColors.success : AppColors.warning,
                    ),
                  ),
                  progressColor: _passed
                      ? AppColors.success
                      : AppColors.warning,
                  backgroundColor: Colors.grey.shade200,
                  circularStrokeCap: CircularStrokeCap.round,
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              l10n.questionsCorrect(
                widget.correctCount,
                widget.quiz.questions.length,
              ),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              _passed ? l10n.passedMsg : l10n.failedMsg,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeCard(BuildContext context, AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Time taken
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.timeTaken,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _formatTime(widget.secondsElapsed),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Speed bonus
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.gold.withValues(alpha: 0.1),
                    AppColors.gold.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.gold.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('⚡', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.speedBonus,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '+${_speedBonus.toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: _speedBonus > 10
                              ? AppColors.success
                              : _speedBonus > 0
                              ? AppColors.warning
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionReview(
    BuildContext context,
    AppLocalizations l10n,
    Question question,
    int index,
  ) {
    final selected = index < widget.selectedAnswers.length
        ? widget.selectedAnswers[index]
        : -1;
    final isCorrect = selected == question.correctOptionIndex;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question header
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCorrect
                        ? AppColors.success.withValues(alpha: 0.15)
                        : AppColors.error.withValues(alpha: 0.15),
                  ),
                  child: Center(
                    child: Icon(
                      isCorrect ? Icons.check_rounded : Icons.close_rounded,
                      color: isCorrect ? AppColors.success : AppColors.error,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    l10n.question(index + 1),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              L10nHelper.resolve(context, question.textKey),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),

            // Your answer
            if (!isCorrect && selected >= 0) ...[
              Row(
                children: [
                  const Icon(
                    Icons.cancel_rounded,
                    color: AppColors.error,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${l10n.yourAnswer}: ',
                    style: const TextStyle(
                      color: AppColors.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      L10nHelper.resolve(
                        context,
                        question.optionKeys[selected],
                      ),
                      style: const TextStyle(color: AppColors.error),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
            ],

            // Correct answer
            Row(
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.success,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  '${l10n.correctAnswer}: ',
                  style: const TextStyle(
                    color: AppColors.success,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Text(
                    L10nHelper.resolve(
                      context,
                      question.optionKeys[question.correctOptionIndex],
                    ),
                    style: const TextStyle(color: AppColors.success),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Explanation
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.lightbulb_outlined,
                    color: AppColors.info,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      L10nHelper.resolve(context, question.explanationKey),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
