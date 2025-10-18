import 'package:flutter/material.dart';

class AppColors{
  static const Color purple = Color(0xFF5669FF);
  static const Color red = Color(0xFFFF5659);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1C1C1C);

}

class AppImages{
  // Splash Screen
  static const String splashLogo ="assets/images/splashLogo.png";

  // onboarding

}

class AppThemes{
  static var lightTheme = ThemeData(
    colorScheme: ColorScheme.dark( primary:AppColors.purple),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: "Janna LT",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.purple),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleLarge: TextStyle(
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "Janna LT",
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Janna LT",
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: "Janna LT",
        letterSpacing: 0,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );

}