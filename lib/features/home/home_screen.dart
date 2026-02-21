import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smart_school_demo_by_yasser_ashraf/core/l10n/app_localizations.dart';
import '../../core/theme/app_colors.dart';
import '../../core/l10n/l10n_helper.dart';
import '../../data/content/science_content.dart';
import '../progress/progress_provider.dart';
import '../subject/subject_screen.dart';
import '../settings/settings_screen.dart';
import '../gamification/level_progress_widget.dart';
import '../../core/gamification/gamification_provider.dart';
import '../../features/profile/profile_provider.dart';
import '../../features/profile/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );

    // Load progress on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProgressProvider>().loadProgress().then((_) {
        _fadeController.forward();
      });
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final progress = context.watch<ProgressProvider>();
    final profile = context.watch<ProfileProvider>();
    final subject = ScienceContent.getSubject();

    return Scaffold(
      body: SafeArea(
        child: progress.isLoaded
            ? FadeTransition(
                opacity: _fadeAnimation,
                child: CustomScrollView(
                  slivers: [
                    // App bar
                    SliverAppBar(
                      expandedHeight: 80,
                      floating: true,
                      pinned: false,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: const EdgeInsetsDirectional.only(
                          start: 20,
                          bottom: 16,
                        ),
                        title: Text(
                          l10n.appTitle,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.settings_rounded),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SettingsScreen(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),

                    // Content
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          // Welcome card
                          _buildWelcomeCard(l10n, profile.currentUser),
                          const SizedBox(height: 20),

                          // Level Progress
                          const LevelProgressWidget(),
                          const SizedBox(height: 20),

                          // Progress overview
                          _buildProgressCard(context, l10n, progress),
                          const SizedBox(height: 20),

                          // Stats row
                          _buildStatsRow(l10n, progress),
                          const SizedBox(height: 24),

                          // Subject card
                          Text(
                            l10n.lessons,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 12),
                          _buildSubjectCard(context, l10n, subject, progress),
                          const SizedBox(height: 24),

                          // Badges section
                          Text(
                            l10n.badges,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 12),
                          _buildBadgesGrid(context, l10n, progress),
                          const SizedBox(height: 40),
                        ]),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: Lottie.asset(
                        'assets/lottie/Book loading.json',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildWelcomeCard(AppLocalizations l10n, User? user) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: AppColors.primaryGradient,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.welcomeBack,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  user?.name ?? 'Student',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.continueLearning,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: Lottie.asset(
              'assets/lottie/STUDENT.json',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(
    BuildContext context,
    AppLocalizations l10n,
    ProgressProvider progress,
  ) {
    final percent = progress.overallProgress;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircularPercentIndicator(
              radius: 45,
              lineWidth: 8,
              percent: percent.clamp(0.0, 1.0),
              center: Text(
                '${(percent * 100).round()}%',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              progressColor: AppColors.primary,
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              animationDuration: 1000,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.overallProgress,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    progress.completedLessonsCount == 0
                        ? l10n.noProgressYet
                        : '${l10n.lessonsCompleted}: ${progress.completedLessonsCount}/3',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(AppLocalizations l10n, ProgressProvider progress) {
    return Row(
      children: [
        Expanded(
          child: _buildStatTile(
            icon: Icons.menu_book_rounded,
            label: l10n.lessonsCompleted,
            value: '${progress.completedLessonsCount}/3',
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatTile(
            icon: Icons.emoji_events_rounded,
            label: l10n.bestScore,
            value: progress.bestQuizScore != null
                ? '${progress.bestQuizScore! * 10}%'
                : '--',
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Consumer<GamificationProvider>(
            builder: (context, gamification, _) {
              return _buildStatTile(
                icon: Icons.workspace_premium_rounded,
                label: l10n.badges,
                value: '${gamification.earnedBadges.length}/4',
                color: AppColors.gold,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatTile({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(
    BuildContext context,
    AppLocalizations l10n,
    subject,
    ProgressProvider progress,
  ) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SubjectScreen()),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text('🔬', style: TextStyle(fontSize: 32)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      L10nHelper.resolve(context, subject.nameKey),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      L10nHelper.resolve(context, subject.descriptionKey),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 6,
                      percent: (progress.completedLessonsCount / 3).clamp(
                        0.0,
                        1.0,
                      ),
                      progressColor: AppColors.primary,
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      barRadius: const Radius.circular(3),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: AppColors.textSecondary.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadgesGrid(
    BuildContext context,
    AppLocalizations l10n,
    ProgressProvider progress,
  ) {
    final gamification = context.watch<GamificationProvider>();
    final badges = [
      _BadgeData(
        'first_lesson',
        l10n.badgeFirstLesson,
        l10n.badgeFirstLessonDesc,
        '🎯',
      ),
      _BadgeData(
        'quiz_passed',
        l10n.badgeQuizPassed,
        l10n.badgeQuizPassedDesc,
        '✅',
      ),
      _BadgeData(
        'quiz_master',
        l10n.badgeQuizMaster,
        l10n.badgeQuizMasterDesc,
        '🏆',
      ),
      _BadgeData(
        'all_lessons',
        l10n.badgeAllLessons,
        l10n.badgeAllLessonsDesc,
        '🎓',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: badges.length,
      itemBuilder: (context, index) {
        final badge = badges[index];
        final earned = gamification.earnedBadges.contains(badge.id);
        return Card(
          color: earned ? AppColors.gold.withValues(alpha: 0.1) : null,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  earned ? badge.emoji : '🔒',
                  style: TextStyle(
                    fontSize: 28,
                    color: earned ? null : Colors.grey,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  badge.name,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: earned
                        ? null
                        : Theme.of(context).textTheme.bodySmall?.color,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  badge.description,
                  style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BadgeData {
  final String id;
  final String name;
  final String description;
  final String emoji;
  const _BadgeData(this.id, this.name, this.description, this.emoji);
}
