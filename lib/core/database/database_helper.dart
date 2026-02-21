import 'package:sqflite/sqflite.dart';
import '../constants/app_constants.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = '$dbPath/${AppConstants.dbName}';
    return openDatabase(
      path,
      version: AppConstants.dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // 1. Users Table
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT UNIQUE,
        password TEXT,
        avatar_path TEXT NOT NULL,
        created_at TEXT NOT NULL
      )
    ''');

    // 2. Lesson Progress
    await db.execute('''
      CREATE TABLE lesson_progress (
        user_id INTEGER NOT NULL,
        lesson_id TEXT NOT NULL,
        is_completed INTEGER NOT NULL DEFAULT 0,
        completed_at TEXT,
        last_step_index INTEGER NOT NULL DEFAULT 0,
        PRIMARY KEY (user_id, lesson_id),
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      )
    ''');

    // 3. Quiz Attempts
    await db.execute('''
      CREATE TABLE quiz_attempts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        quiz_id TEXT NOT NULL,
        score INTEGER NOT NULL,
        total_questions INTEGER NOT NULL,
        attempt_date TEXT NOT NULL,
        selected_answers TEXT NOT NULL,
        time_seconds INTEGER NOT NULL DEFAULT 0,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      )
    ''');

    // 4. Badges
    await db.execute('''
      CREATE TABLE badges (
        user_id INTEGER NOT NULL,
        badge_id TEXT NOT NULL,
        is_earned INTEGER NOT NULL DEFAULT 0,
        earned_at TEXT,
        PRIMARY KEY (user_id, badge_id),
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      )
    ''');

    // 5. User Stats
    await db.execute('''
      CREATE TABLE user_stats (
        user_id INTEGER PRIMARY KEY,
        total_xp INTEGER NOT NULL DEFAULT 0,
        level INTEGER NOT NULL DEFAULT 1,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(
        'ALTER TABLE quiz_attempts ADD COLUMN time_seconds INTEGER NOT NULL DEFAULT 0',
      );
    }
    if (oldVersion < 3) {
      // Logic for version 2 (user_stats creation) was here, but we are moving past it.
      // If upgrading from v2 to v3, 'user_stats' already exists with check id=1.

      // 1. Create Users table
      await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          avatar_path TEXT NOT NULL,
          created_at TEXT NOT NULL
        )
      ''');

      // Create default user (if migrating from existing data)
      // Create default user for migration
      await db.insert('users', {
        'name': 'Student',
        'avatar_path': 'assets/avatars/boy_1.png',
        'created_at': DateTime.now().toIso8601String(),
      });

      // 2. Migrate Lesson Progress (PK change)
      await db.execute(
        'ALTER TABLE lesson_progress RENAME TO lesson_progress_old',
      );
      await db.execute('''
        CREATE TABLE lesson_progress (
          user_id INTEGER NOT NULL DEFAULT 1,
          lesson_id TEXT NOT NULL,
          is_completed INTEGER NOT NULL DEFAULT 0,
          completed_at TEXT,
          last_step_index INTEGER NOT NULL DEFAULT 0,
          PRIMARY KEY (user_id, lesson_id),
          FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
        )
      ''');
      await db.execute('''
        INSERT INTO lesson_progress (user_id, lesson_id, is_completed, completed_at, last_step_index)
        SELECT 1, lesson_id, is_completed, completed_at, last_step_index FROM lesson_progress_old
      ''');
      await db.execute('DROP TABLE lesson_progress_old');

      // 3. Migrate Badges (PK change)
      await db.execute('ALTER TABLE badges RENAME TO badges_old');
      await db.execute('''
        CREATE TABLE badges (
          user_id INTEGER NOT NULL DEFAULT 1,
          badge_id TEXT NOT NULL,
          is_earned INTEGER NOT NULL DEFAULT 0,
          earned_at TEXT,
          PRIMARY KEY (user_id, badge_id),
          FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
        )
      ''');
      await db.execute('''
        INSERT INTO badges (user_id, badge_id, is_earned, earned_at)
        SELECT 1, badge_id, is_earned, earned_at FROM badges_old
      ''');
      await db.execute('DROP TABLE badges_old');

      // 4. Migrate User Stats
      final userStatsExists = (await db.query(
        'sqlite_master',
        where: 'type = ? AND name = ?',
        whereArgs: ['table', 'user_stats'],
      )).isNotEmpty;

      if (userStatsExists) {
        await db.execute('ALTER TABLE user_stats RENAME TO user_stats_old');
      }

      await db.execute('''
        CREATE TABLE user_stats (
          user_id INTEGER PRIMARY KEY,
          total_xp INTEGER NOT NULL DEFAULT 0,
          level INTEGER NOT NULL DEFAULT 1,
          FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
        )
      ''');

      if (userStatsExists) {
        await db.execute('''
          INSERT INTO user_stats (user_id, total_xp, level)
          SELECT 1, total_xp, level FROM user_stats_old
        ''');
        await db.execute('DROP TABLE user_stats_old');
      } else {
        // Initialize default stats if new table
        await db.insert('user_stats', {
          'user_id': 1,
          'total_xp': 0,
          'level': 1,
        });
      }

      // 5. Migrate Quiz Attempts (Add column)
      await db.execute(
        'ALTER TABLE quiz_attempts ADD COLUMN user_id INTEGER NOT NULL DEFAULT 1 REFERENCES users(id) ON DELETE CASCADE',
      );
    }
    if (oldVersion < 4) {
      await db.execute('ALTER TABLE users RENAME TO users_old');
      await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT UNIQUE,
          password TEXT,
          avatar_path TEXT NOT NULL,
          created_at TEXT NOT NULL
        )
      ''');
      await db.execute('''
        INSERT INTO users (id, name, avatar_path, created_at)
        SELECT id, name, avatar_path, created_at FROM users_old
      ''');
      await db.execute('DROP TABLE users_old');
    }
  }

  // -- User Stats --

  Future<Map<String, dynamic>> getUserStats(int userId) async {
    final db = await database;
    final results = await db.query(
      'user_stats',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    if (results.isNotEmpty) return results.first;
    // Return default if not found (shouldn't happen if initialized correctly)
    return {'total_xp': 0, 'level': 1};
  }

  Future<void> addXp(int userId, int amount) async {
    final db = await database;
    final stats = await getUserStats(userId);
    final currentXp = (stats['total_xp'] as int);
    final newXp = currentXp + amount;
    // Simple level formula: Level = 1 + (XP / 100)
    final newLevel = 1 + (newXp ~/ 100);

    await db.insert('user_stats', {
      'user_id': userId,
      'total_xp': newXp,
      'level': newLevel,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // -- Lesson Progress --

  Future<Map<String, dynamic>?> getLessonProgress(
    int userId,
    String lessonId,
  ) async {
    final db = await database;
    final results = await db.query(
      'lesson_progress',
      where: 'user_id = ? AND lesson_id = ?',
      whereArgs: [userId, lessonId],
    );
    return results.isNotEmpty ? results.first : null;
  }

  Future<List<Map<String, dynamic>>> getAllLessonProgress(int userId) async {
    final db = await database;
    return db.query(
      'lesson_progress',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  Future<void> saveLessonProgress({
    required int userId,
    required String lessonId,
    required bool isCompleted,
    required int lastStepIndex,
  }) async {
    final db = await database;
    await db.insert('lesson_progress', {
      'user_id': userId,
      'lesson_id': lessonId,
      'is_completed': isCompleted ? 1 : 0,
      'completed_at': isCompleted ? DateTime.now().toIso8601String() : null,
      'last_step_index': lastStepIndex,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // -- Quiz Attempts --

  Future<void> saveQuizAttempt({
    required int userId,
    required String quizId,
    required int score,
    required int totalQuestions,
    required List<int> selectedAnswers,
    int timeSeconds = 0,
  }) async {
    final db = await database;
    await db.insert('quiz_attempts', {
      'user_id': userId,
      'quiz_id': quizId,
      'score': score,
      'total_questions': totalQuestions,
      'attempt_date': DateTime.now().toIso8601String(),
      'selected_answers': selectedAnswers.join(','),
      'time_seconds': timeSeconds,
    });
  }

  Future<List<Map<String, dynamic>>> getQuizAttempts(
    int userId,
    String quizId,
  ) async {
    final db = await database;
    return db.query(
      'quiz_attempts',
      where: 'user_id = ? AND quiz_id = ?',
      whereArgs: [userId, quizId],
      orderBy: 'attempt_date DESC',
    );
  }

  Future<int?> getBestQuizScore(int userId, String quizId) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT MAX(score) as best FROM quiz_attempts WHERE user_id = ? AND quiz_id = ?',
      [userId, quizId],
    );
    return result.first['best'] as int?;
  }

  // -- Badges --

  Future<void> earnBadge(int userId, String badgeId) async {
    final db = await database;
    await db.insert('badges', {
      'user_id': userId,
      'badge_id': badgeId,
      'is_earned': 1,
      'earned_at': DateTime.now().toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<Map<String, dynamic>>> getAllBadges(int userId) async {
    final db = await database;
    return db.query('badges', where: 'user_id = ?', whereArgs: [userId]);
  }

  Future<bool> isBadgeEarned(int userId, String badgeId) async {
    final db = await database;
    final results = await db.query(
      'badges',
      where: 'user_id = ? AND badge_id = ? AND is_earned = 1',
      whereArgs: [userId, badgeId],
    );
    return results.isNotEmpty;
  }

  // -- Utility --

  Future<int> getCompletedLessonCount(int userId) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM lesson_progress WHERE user_id = ? AND is_completed = 1',
      [userId],
    );
    return result.first['count'] as int? ?? 0;
  }
}
