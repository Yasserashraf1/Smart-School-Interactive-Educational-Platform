class AppConstants {
  AppConstants._();

  static const double quizPassThreshold = 0.7;
  static const int totalLessons = 3;
  static const String subjectId = 'integrated_science_aquatic';
  static const String quizId = 'aquatic_ecosystem_quiz';

  // Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 800);

  // Database
  static const String dbName = 'smart_school.db';
  static const int dbVersion = 4; // bumped for user profiles

  // SharedPreferences keys
  static const String keyStudentName = 'student_name';
  static const String keyLocale = 'locale';

  // Badge IDs
  static const String badgeFirstLesson = 'first_lesson';
  static const String badgeQuizMaster = 'quiz_master';
  static const String badgeAllLessons = 'all_lessons';
  static const String badgeQuizPassed = 'quiz_passed';

  // Quiz Timer
  static const int quizTimeLimitSeconds = 600; // 10 minutes
  static const double maxSpeedBonus = 20.0; // max 20% bonus for speed
}
