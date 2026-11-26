import 'package:flutter/material.dart';

abstract final class AppColors {
  static const background = Color(0xFFAABBF5);
  static const cream = Color(0xFFFCF8F1);
  static const pink = Color(0xFFEC91C5);
  static const green = Color(0xFF5C8F82);
  static const greenText = Color(0xFF234A42);
  static const yellow = Color(0xFFF2B500);
  static const ink = Color(0xFF111111);
  static const muted = Color(0xFF454148);

}

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.pink,
      brightness: Brightness.light,
      surface: AppColors.cream,
      onSurface: AppColors.ink,
    ),
    useMaterial3: true,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.ink),
      bodyMedium: TextStyle(color: AppColors.ink),
      bodySmall: TextStyle(color: AppColors.muted),
      titleLarge: TextStyle(color: AppColors.ink),
      titleMedium: TextStyle(color: AppColors.ink),
    ),
    iconTheme: const IconThemeData(color: AppColors.ink),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cream,
      hintStyle: const TextStyle(color: AppColors.muted),
      labelStyle: const TextStyle(color: AppColors.muted),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.ink, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.ink, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.greenText, width: 3),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.pink,
        foregroundColor: AppColors.ink,
        side: const BorderSide(color: AppColors.ink, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: const Size(0, 52),
        textStyle: const TextStyle(fontWeight: FontWeight.w800),
      ),
    ),
  );
}
