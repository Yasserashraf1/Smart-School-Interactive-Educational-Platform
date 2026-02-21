import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school_demo_by_yasser_ashraf/core/l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/theme/app_colors.dart';
import '../../core/l10n/l10n_helper.dart';
import '../../data/models/models.dart';
import '../progress/progress_provider.dart';
import 'video_lesson_widget.dart';
import '../../core/gamification/gamification_provider.dart';
import '../gamification/badge_unlock_dialog.dart';
import '../gamification/sort_game_widget.dart';

class LessonScreen extends StatefulWidget {
  final Lesson lesson;
  const LessonScreen({super.key, required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late PageController _pageController;
  int _currentStep = 0;
  int? _selectedAnswer;
  bool _answerRevealed = false;
  bool _gameCompleted = false;

  @override
  void initState() {
    super.initState();
    // Resume from last step
    final lastStep = context.read<ProgressProvider>().getLastStepIndex(
      widget.lesson.id,
    );
    _currentStep = lastStep.clamp(0, widget.lesson.steps.length - 1);
    _pageController = PageController(initialPage: _currentStep);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToStep(int index) {
    setState(() {
      _currentStep = index;
      _selectedAnswer = null;
      _answerRevealed = false;
      _gameCompleted = false;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    context.read<ProgressProvider>().saveStepProgress(widget.lesson.id, index);
  }

  void _completeLesson() async {
    final progress = context.read<ProgressProvider>();
    final gamification = context.read<GamificationProvider>();

    // 1. Mark as complete in Progress
    await progress.completeLesson(widget.lesson.id);

    // 2. Award XP
    await gamification.addXp(50);

    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;

    // 3. Check for Badges & Show Dialogs sequentially
    if (progress.completedLessonsCount == 1) {
      if (await gamification.unlockBadge(
        GamificationProvider.badgeFirstLesson,
      )) {
        if (!mounted) return;
        await showDialog(
          context: context,
          builder: (_) => BadgeUnlockDialog(
            badgeName: l10n.badgeFirstLesson,
            badgeDescription: l10n.badgeFirstLessonDesc,
            emoji: '🎯',
          ),
        );
      }
    }

    if (progress.completedLessonsCount >= 3) {
      // Hardcoded 3 for now as total
      if (await gamification.unlockBadge(
        GamificationProvider.badgeAllLessons,
      )) {
        if (!mounted) return;
        await showDialog(
          context: context,
          builder: (_) => BadgeUnlockDialog(
            badgeName: l10n.badgeAllLessons,
            badgeDescription: l10n.badgeAllLessonsDesc,
            emoji: '🎓',
          ),
        );
      }
    }

    if (!mounted) return;

    // 4. Show Lesson Completion Dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🎉', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 16),
            Text(
              l10n.lessonCompleted,
              style: Theme.of(ctx).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.xpGained(50),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.gold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.lessonCompletedMsg,
              textAlign: TextAlign.center,
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: Text(l10n.backToSubject),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final steps = widget.lesson.steps;
    final isLastStep = _currentStep == steps.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(L10nHelper.resolve(context, widget.lesson.titleKey)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              children: [
                Text(
                  l10n.stepOf(_currentStep + 1, steps.length),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: steps.length,
                  effect: WormEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: AppColors.primary,
                    dotColor: AppColors.primary.withValues(alpha: 0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Video lesson section
          if (widget.lesson.videoIds.isNotEmpty && _currentStep == 0)
            VideoLessonWidget(lesson: widget.lesson),
          // Lesson content
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: steps.length,
              onPageChanged: (index) => setState(() => _currentStep = index),
              itemBuilder: (context, index) {
                final step = steps[index];
                if (step.type == StepType.interactiveQuestion) {
                  return _buildQuestionStep(context, step);
                } else if (step.type == StepType.sortGame) {
                  return SortGameWidget(
                    onCompleted: () {
                      setState(() => _gameCompleted = true);
                    },
                  );
                }
                return _buildTextStep(context, step);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              if (_currentStep > 0)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _goToStep(_currentStep - 1),
                    child: Text(l10n.previous),
                  ),
                ),
              if (_currentStep > 0) const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: _canProceed(steps[_currentStep])
                      ? isLastStep
                            ? _completeLesson
                            : () => _goToStep(_currentStep + 1)
                      : null,
                  child: Text(isLastStep ? l10n.markAsComplete : l10n.next),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _canProceed(LessonStep step) {
    if (step.type == StepType.interactiveQuestion) {
      return _answerRevealed;
    } else if (step.type == StepType.sortGame) {
      return _gameCompleted;
    }
    return true;
  }

  Widget _buildTextStep(BuildContext context, LessonStep step) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            L10nHelper.resolve(context, step.titleKey),
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            L10nHelper.resolve(context, step.contentKey),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionStep(BuildContext context, LessonStep step) {
    final l10n = AppLocalizations.of(context)!;
    final options = step.optionKeys ?? [];
    final correctIndex = step.correctOptionIndex ?? 0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.help_outline_rounded,
              color: AppColors.warning,
              size: 28,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            L10nHelper.resolve(context, step.questionKey ?? step.titleKey),
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.selectAnswer,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),

          // Options
          ...List.generate(options.length, (i) {
            final isSelected = _selectedAnswer == i;
            final isCorrect = i == correctIndex;
            Color? borderColor;
            Color? bgColor;
            IconData? trailingIcon;

            if (_answerRevealed) {
              if (isCorrect) {
                borderColor = AppColors.success;
                bgColor = AppColors.success.withValues(alpha: 0.08);
                trailingIcon = Icons.check_circle_rounded;
              } else if (isSelected && !isCorrect) {
                borderColor = AppColors.error;
                bgColor = AppColors.error.withValues(alpha: 0.08);
                trailingIcon = Icons.cancel_rounded;
              }
            } else if (isSelected) {
              borderColor = AppColors.primary;
              bgColor = AppColors.primary.withValues(alpha: 0.05);
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: _answerRevealed
                    ? null
                    : () => setState(() => _selectedAnswer = i),
                borderRadius: BorderRadius.circular(14),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:
                        bgColor ??
                        Theme.of(context).cardTheme.color ??
                        Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: borderColor ?? Colors.grey.shade200,
                      width: isSelected || (_answerRevealed && isCorrect)
                          ? 2
                          : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? (borderColor ?? AppColors.primary)
                              : Colors.grey.shade200,
                        ),
                        child: Center(
                          child: Text(
                            String.fromCharCode(65 + i), // A, B, C, D
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          L10nHelper.resolve(context, options[i]),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      if (trailingIcon != null)
                        Icon(trailingIcon, color: borderColor, size: 22),
                    ],
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 12),

          // Check answer button
          if (!_answerRevealed && _selectedAnswer != null)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                ),
                onPressed: () => setState(() => _answerRevealed = true),
                child: Text(l10n.complete),
              ),
            ),

          // Explanation
          if (_answerRevealed && step.explanationKey != null) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.info.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.lightbulb_outlined,
                        color: AppColors.info,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.explanation,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.info,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    L10nHelper.resolve(context, step.explanationKey!),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
