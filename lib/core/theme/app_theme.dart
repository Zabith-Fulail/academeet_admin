import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF1E6B9E);
  static const primaryDark = Color(0xFF14507A);
  static const accent = Color(0xFF00C897);
  static const background = Color(0xFF0F1923);
  static const surface = Color(0xFF1A2738);
  static const card = Color(0xFF1E2E42);
  static const textPrimary = Color(0xFFF0F4F8);
  static const textSecondary = Color(0xFF8FA3B8);
  static const textMuted = Color(0xFF4D6478);
  static const success = Color(0xFF00C897);
  static const warning = Color(0xFFFFB84D);
  static const error = Color(0xFFFF5C72);
  static const info = Color(0xFF4DAEFF);
  static const divider = Color(0xFF253545);
}

class AppTextStyles {
  static const h1 = TextStyle(fontSize: 28, fontWeight: FontWeight.w700);
  static const h2 = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
  static const h3 = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const h4 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const body = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static const label = TextStyle(fontSize: 13, fontWeight: FontWeight.w500);
  static const caption = TextStyle(fontSize: 11, fontWeight: FontWeight.w400);
}

class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
}

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.dark(primary: AppColors.primary),
  );
}
