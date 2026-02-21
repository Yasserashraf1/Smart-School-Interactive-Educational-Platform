import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary palette — ocean/water inspired for science theme
  static const Color primary = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF42A5F5);
  static const Color primaryDark = Color(0xFF0D47A1);

  // Secondary — warm accent for interactivity
  static const Color secondary = Color(0xFF26A69A);
  static const Color secondaryLight = Color(0xFF80CBC4);

  // Surface colors — Light
  static const Color surface = Color(0xFFF5F7FA);
  static const Color surfaceCard = Colors.white;

  // Surface colors — Dark
  static const Color surfaceDark = Color(0xFF1A1A2E);
  static const Color surfaceCardDark = Color(0xFF16213E);

  // Semantic colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFA726);
  static const Color info = Color(0xFF29B6F6);

  // Text colors — Light
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF5A6178);
  static const Color textOnPrimary = Colors.white;

  // Text colors — Dark
  static const Color textOnDark = Color(0xFFE8E8EF);
  static const Color textSecondaryDark = Color(0xFF9A9EB8);

  // Gamification
  static const Color gold = Color(0xFFFFD700);
  static const Color silver = Color(0xFFC0C0C0);
  static const Color bronze = Color(0xFFCD7F32);

  // Gradient pairs
  static const List<Color> primaryGradient = [
    Color(0xFF1565C0),
    Color(0xFF42A5F5),
  ];
  static const List<Color> successGradient = [
    Color(0xFF43A047),
    Color(0xFF66BB6A),
  ];
  static const List<Color> quizGradient = [
    Color(0xFF7B1FA2),
    Color(0xFFAB47BC),
  ];
}
