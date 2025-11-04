import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Urbanist',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,

    // Skema warna untuk tema terang
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.orangeAccent,
      background: AppColors.backgroundLight,
      surface: AppColors.cardLight, // Warna untuk Card
      onBackground: AppColors.textLight, // Warna teks di atas background
      onSurface: AppColors.textLight, // Warna teks di atas card
      error: AppColors.incorrect,
    ),

    // Tema untuk AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.textLight),
      titleTextStyle: TextStyle(
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.bold,
        color: AppColors.textLight,
        fontSize: 20,
      ),
    ),

    // Tema untuk TextField
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: TextStyle(
          fontFamily: 'Urbanist',
          color: AppColors.textLight.withOpacity(0.5),
        )
    ),
  );
  

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Urbanist',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,

    // Skema warna untuk tema gelap
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.orangeAccent,
      background: AppColors.backgroundDark,
      surface: AppColors.cardDark, // Warna untuk Card
      onBackground: AppColors.textDark, // Warna teks di atas background
      onSurface: AppColors.textDark, // Warna teks di atas card
      error: AppColors.incorrect,
    ),

    // Tema untuk AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.textDark),
      titleTextStyle: TextStyle(
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
        fontSize: 20,
      ),
    ),

    // Tema untuk TextField
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: TextStyle(
          fontFamily: 'Urbanist',
          color: AppColors.textDark.withOpacity(0.5),
        )
    ),
  );
}