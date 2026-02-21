import 'package:flutter/foundation.dart';
import '../../core/database/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_model.dart';

class ProfileProvider extends ChangeNotifier {
  User? _currentUser;
  List<User> _availableUsers = [];
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  List<User> get availableUsers => _availableUsers;
  bool get isLoading => _isLoading;

  final DatabaseHelper _db = DatabaseHelper.instance;

  Future<void> loadProfiles() async {
    _isLoading = true;
    notifyListeners();

    try {
      final db = await _db.database;
      final results = await db.query('users');
      _availableUsers = results.map((map) => User.fromMap(map)).toList();

      final prefs = await SharedPreferences.getInstance();
      final lastUserId = prefs.getInt('current_user_id');

      if (lastUserId != null) {
        try {
          final lastUser = _availableUsers.firstWhere(
            (u) => u.id == lastUserId,
          );
          await login(lastUser);
        } catch (_) {
          // User not found in list
        }
      }
    } catch (e) {
      debugPrint('Error loading profiles: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login(User user) async {
    _currentUser = user;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('current_user_id', user.id);
    notifyListeners();
  }

  Future<bool> loginWithEmail(String email, String password) async {
    final db = await _db.database;
    final results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      _currentUser = User.fromMap(results.first);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('current_user_id', _currentUser!.id);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('current_user_id');
    notifyListeners();
  }

  Future<User?> signUp(
    String name,
    String email,
    String password,
    String avatarPath,
  ) async {
    final db = await _db.database;
    try {
      final id = await db.insert('users', {
        'name': name,
        'email': email,
        'password': password,
        'avatar_path': avatarPath,
        'created_at': DateTime.now().toIso8601String(),
      });

      final newUser = User(
        id: id,
        name: name,
        email: email,
        password: password,
        avatarPath: avatarPath,
        createdAt: DateTime.now().toIso8601String(), // approx
      );

      _availableUsers.add(newUser);
      await login(newUser);
      return newUser;
    } catch (e) {
      debugPrint('Error signing up: $e');
      return null; // Might happen if email already exists (UNIQUE constraint)
    }
  }
}
