import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';
import '../../core/constants/app_constants.dart';

class ProgressProvider extends ChangeNotifier {
  final DatabaseHelper _db = DatabaseHelper.instance;

  Map<String, bool> _lessonCompletion = {};
  Map<String, int> _lessonLastStep = {};
  final Map<String, int> _quizScores = {};
  int? _userId;
  int? _bestQuizScore;
  int _completedLessonsCount = 0;
  Set<String> _earnedBadges = {};
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  int get completedLessonsCount => _completedLessonsCount;
  int? get bestQuizScore => _bestQuizScore;
  Set<String> get earnedBadges => _earnedBadges;

  double get overallProgress {
    // Lessons count for 80% of progress, quiz pass for 20%
    final lessonProgress = _completedLessonsCount / AppConstants.totalLessons;
    final quizProgress =
        (_bestQuizScore != null &&
            _bestQuizScore! >= (AppConstants.quizPassThreshold * 10).round())
        ? 1.0
        : 0.0;
    return (lessonProgress * 0.8) + (quizProgress * 0.2);
  }

  bool isLessonCompleted(String lessonId) {
    return _lessonCompletion[lessonId] ?? false;
  }

  bool isLessonUnlocked(String lessonId, int order) {
    if (order == 1) return true; // First lesson always unlocked
    final prevId = 'lesson_${order - 1}';
    return isLessonCompleted(prevId);
  }

  bool get isQuizUnlocked {
    return _completedLessonsCount >= AppConstants.totalLessons;
  }

  int getLastStepIndex(String lessonId) {
    return _lessonLastStep[lessonId] ?? 0;
  }

  // Called when ProfileProvider updates the user
  Future<void> updateUserId(int? userId) async {
    _userId = userId;
    if (_userId != null) {
      await loadProgress();
    } else {
      _lessonCompletion = {};
      _lessonLastStep = {};
      _completedLessonsCount = 0;
      _quizScores.clear();
      _earnedBadges.clear();
      _isLoaded = false;
      notifyListeners();
    }
  }

  Future<void> loadProgress() async {
    if (_userId == null) return;

    final allProgress = await _db.getAllLessonProgress(_userId!);
    _lessonCompletion = {};
    _lessonLastStep = {};
    for (final row in allProgress) {
      final id = row['lesson_id'] as String;
      _lessonCompletion[id] = (row['is_completed'] as int) == 1;
      _lessonLastStep[id] = row['last_step_index'] as int;
    }

    // Auto-repair corrupted lesson progress (if a user revisits a completed lesson, previous buggy code set it to false)
    for (int i = AppConstants.totalLessons; i > 1; i--) {
      if ((_lessonCompletion['lesson_$i'] ?? false) &&
          !(_lessonCompletion['lesson_${i - 1}'] ?? false)) {
        _lessonCompletion['lesson_${i - 1}'] = true;
        _lessonLastStep['lesson_${i - 1}'] = 0;
        await _db.saveLessonProgress(
          userId: _userId!,
          lessonId: 'lesson_${i - 1}',
          isCompleted: true,
          lastStepIndex: 0,
        );
      }
    }

    _completedLessonsCount = await _db.getCompletedLessonCount(_userId!);
    _bestQuizScore = await _db.getBestQuizScore(_userId!, AppConstants.quizId);
    if (_bestQuizScore != null) {
      _quizScores[AppConstants.quizId] = _bestQuizScore!;
    }

    final badges = await _db.getAllBadges(_userId!);
    _earnedBadges = badges
        .where((b) => (b['is_earned'] as int) == 1)
        .map((b) => b['badge_id'] as String)
        .toSet();

    _isLoaded = true;
    notifyListeners();
  }

  Future<void> saveStepProgress(String lessonId, int stepIndex) async {
    if (_userId == null) return;

    final alreadyCompleted = _lessonCompletion[lessonId] ?? false;

    await _db.saveLessonProgress(
      userId: _userId!,
      lessonId: lessonId,
      isCompleted: alreadyCompleted,
      lastStepIndex: stepIndex,
    );
    _lessonLastStep[lessonId] = stepIndex;
  }

  Future<void> completeLesson(String lessonId) async {
    if (_userId == null) return;

    await _db.saveLessonProgress(
      userId: _userId!,
      lessonId: lessonId,
      isCompleted: true,
      lastStepIndex: 0, // Assuming 0 for completed lessons
    );
    // Only increment count if it wasn't already completed
    if (!(_lessonCompletion[lessonId] ?? false)) {
      _completedLessonsCount++;
    }
    _lessonCompletion[lessonId] = true;
    _lessonLastStep[lessonId] = 0;

    // Check badges (retained from original, adjusted for new _lessonCompletion)
    if (_lessonCompletion.length == 1) {
      await _earnBadge(AppConstants.badgeFirstLesson);
    }
    if (_lessonCompletion.length >= AppConstants.totalLessons) {
      await _earnBadge(AppConstants.badgeAllLessons);
    }

    notifyListeners();
  }

  Future<void> saveQuizAttempt(
    String quizId,
    int score,
    int totalQuestions,
    List<int> selectedAnswers, {
    int timeSeconds = 0,
  }) async {
    if (_userId == null) return;

    await _db.saveQuizAttempt(
      userId: _userId!,
      quizId: quizId,
      score: score,
      totalQuestions: totalQuestions,
      selectedAnswers: selectedAnswers,
      timeSeconds: timeSeconds,
    );
    // Update the best score for this quiz
    final currentBest = _bestQuizScore ?? 0;
    if (score > currentBest) {
      _bestQuizScore = score;
      _quizScores[quizId] = score;
    }
    // Badge logic moved to UI layer (gamification) - as per original comment

    notifyListeners();
  }

  Future<void> _earnBadge(String badgeId) async {
    if (_userId == null || _earnedBadges.contains(badgeId)) return;
    await _db.earnBadge(
      _userId!,
      badgeId,
    ); // Assuming earnBadge now takes userId
    _earnedBadges.add(badgeId);
  }
}
