import 'package:flutter/foundation.dart';
import '../database/database_helper.dart';

class GamificationProvider extends ChangeNotifier {
  int _totalXp = 0;
  int _level = 1;
  final Set<String> _earnedBadges = {};
  int? _userId;

  // Badge Constants
  static const String badgeFirstLesson = 'first_lesson';
  static const String badgeAllLessons = 'all_lessons';
  static const String badgeQuizPassed = 'quiz_passed';
  static const String badgeQuizMaster = 'quiz_master';
  static const String badgeSpeedster = 'speedster';

  int get totalXp => _totalXp;
  int get level => _level;
  double get levelProgress => (_totalXp % 100) / 100.0;
  Set<String> get earnedBadges => _earnedBadges;

  // Called when ProfileProvider updates the user
  Future<void> updateUserId(int? userId) async {
    _userId = userId;
    if (_userId != null) {
      await loadStats();
    } else {
      _totalXp = 0;
      _level = 1;
      _earnedBadges.clear();
      notifyListeners();
    }
  }

  Future<void> loadStats() async {
    if (_userId == null) return;

    final stats = await DatabaseHelper.instance.getUserStats(_userId!);
    _totalXp = stats['total_xp'] as int;
    _level = stats['level'] as int;

    final badges = await DatabaseHelper.instance.getAllBadges(_userId!);
    _earnedBadges.clear();
    for (var b in badges) {
      if (b['is_earned'] == 1) {
        _earnedBadges.add(b['badge_id'] as String);
      }
    }
    notifyListeners();
  }

  Future<void> addXp(int amount) async {
    if (_userId == null) return;
    await DatabaseHelper.instance.addXp(_userId!, amount);
    await loadStats();
  }

  Future<bool> unlockBadge(String badgeId) async {
    if (_userId == null) return false;
    if (_earnedBadges.contains(badgeId)) return false;

    await DatabaseHelper.instance.earnBadge(_userId!, badgeId);
    await loadStats();
    return true;
  }
}
