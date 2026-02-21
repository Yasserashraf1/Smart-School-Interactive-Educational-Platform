import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smart_school_demo_by_yasser_ashraf/core/l10n/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/l10n/l10n_helper.dart';
import '../../data/content/science_content.dart';
import '../../data/models/models.dart';
import '../progress/progress_provider.dart';
import '../lesson/lesson_screen.dart';
import '../quiz/quiz_screen.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final progress = context.watch<ProgressProvider>();
    final subject = ScienceContent.getSubject();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 180,
              pinned: true,
              elevation: 0,
              backgroundColor: AppColors.primary,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsetsDirectional.only(
                  start: 56,
                  bottom: 16,
                ),
                title: Text(
                  L10nHelper.resolve(context, subject.nameKey),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF2E5BFF), // Deeper blue
                            AppColors.primary,
                            Color(0xFF6B8BFF), // Lighter blue
                          ],
                        ),
                      ),
                    ),
                    // Decorative circle 1
                    Positioned(
                      top: -20,
                      right: -30,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                    // Decorative circle 2
                    Positioned(
                      bottom: -40,
                      right: 40,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                    // Lottie animation illustration
                    Positioned(
                      right: 10,
                      bottom: 20,
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Lottie.asset(
                          'assets/lottie/Online Learning.json',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Description
                  Text(
                    L10nHelper.resolve(context, subject.descriptionKey),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),

                  // Lessons
                  ...subject.lessons.map(
                    (lesson) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildLessonCard(context, l10n, lesson, progress),
                    ),
                  ),

                  const SizedBox(height: 8),
                  // Divider
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          l10n.quiz,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Quiz card
                  _buildQuizCard(context, l10n, subject.quiz, progress),
                  const SizedBox(height: 40),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonCard(
    BuildContext context,
    AppLocalizations l10n,
    Lesson lesson,
    ProgressProvider progress,
  ) {
    final isCompleted = progress.isLessonCompleted(lesson.id);
    final isUnlocked = progress.isLessonUnlocked(lesson.id, lesson.order);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: isUnlocked
            ? () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LessonScreen(lesson: lesson)),
              )
            : null,
        child: Opacity(
          opacity: isUnlocked ? 1.0 : 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Lesson number / status
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppColors.success.withValues(alpha: 0.15)
                        : isUnlocked
                        ? AppColors.primary.withValues(alpha: 0.1)
                        : Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: isCompleted
                        ? const Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.success,
                            size: 28,
                          )
                        : isUnlocked
                        ? Text(
                            lesson.iconEmoji,
                            style: const TextStyle(fontSize: 24),
                          )
                        : const Icon(
                            Icons.lock_rounded,
                            color: Colors.grey,
                            size: 24,
                          ),
                  ),
                ),
                const SizedBox(width: 14),
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${l10n.lessonOf(lesson.order, 3)} — ${L10nHelper.resolve(context, lesson.titleKey)}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 14,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            l10n.minutesShort(lesson.estimatedMinutes),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (isUnlocked && !isCompleted)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: AppColors.primary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCard(
    BuildContext context,
    AppLocalizations l10n,
    Quiz quiz,
    ProgressProvider progress,
  ) {
    final isUnlocked = progress.isQuizUnlocked;
    final bestScore = progress.bestQuizScore;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: isUnlocked
            ? () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => QuizScreen(quiz: quiz)),
              )
            : null,
        child: Opacity(
          opacity: isUnlocked ? 1.0 : 0.5,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: isUnlocked
                ? BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [
                        AppColors.quizGradient[0].withValues(alpha: 0.08),
                        AppColors.quizGradient[1].withValues(alpha: 0.04),
                      ],
                    ),
                  )
                : null,
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: isUnlocked
                        ? AppColors.quizGradient[0].withValues(alpha: 0.15)
                        : Colors.grey.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(
                      isUnlocked ? Icons.quiz_rounded : Icons.lock_rounded,
                      color: isUnlocked
                          ? AppColors.quizGradient[0]
                          : Colors.grey,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        L10nHelper.resolve(context, quiz.titleKey),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isUnlocked
                            ? '${quiz.questions.length} ${l10n.quiz}'
                            : l10n.failedMsg,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      if (bestScore != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          '${l10n.bestScore}: ${bestScore * 10}%',
                          style: TextStyle(
                            color: AppColors.success,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (isUnlocked)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: AppColors.quizGradient[0],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
