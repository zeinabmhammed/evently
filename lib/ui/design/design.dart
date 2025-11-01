import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color lightPrimary = Color(0xFF5669FF);
  static const Color red = Color(0xFFFF5659);
  static const Color backgroundColor = Color(0xFFF2FEFF);
  static const Color black = Color(0xFF1C1C1C);
  static const Color darkBackground = Color(0xFF101127);
  static const Color grey = Color(0xFF7B7B7B);
}

class AppImages {
  //png images
  // Splash Screen
  static const String splashLogo = "assets/images/splashLogo.png";

  // onboarding
  static const String onBoardingLogo = "assets/images/onboardingLogo.png";
  static const String firstOnBoarding = "assets/images/FirstOnBoarding.png";
  static const String secondOnBoarding = "assets/images/SecondOnBoarding.png";
  static const String thirdOnBoarding = "assets/images/thirdOnBoarding.png";
  static const String fourthOnBoarding = "assets/images/ForthOnBoarding.png";

  //forget password
  static const String forgetPassword = "assets/images/forgetPasswordPic.png";

  //Svg images
}

class AppThemes {
  static var lightTheme = ThemeData(
    colorScheme: ColorScheme.light(primary: AppColors.lightPrimary),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: Colors.transparent,

      titleTextStyle: GoogleFonts.jockeyOne(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.lightPrimary,
      ),

      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.lightPrimary),
    ),

    textTheme: TextTheme(

      bodyLarge: GoogleFonts.inter(
        color: AppColors.backgroundColor,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),

      bodyMedium: GoogleFonts.inter(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),

      titleLarge: GoogleFonts.inter(
        color: AppColors.lightPrimary,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),

      titleMedium: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),

      titleSmall: GoogleFonts.inter(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.grey),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.grey),
      ),
      labelStyle: GoogleFonts.inter(
          color: AppColors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w500),
      hintStyle: GoogleFonts.inter(
          color: AppColors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w500),
     contentPadding: EdgeInsets.all(16.0),

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.lightPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.inter(
          color: AppColors.backgroundColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightPrimary,
      selectedIconTheme: IconThemeData(
        color: AppColors.backgroundColor,
        size: 33,
      ),
      unselectedIconTheme: IconThemeData(color: AppColors.black, size: 27),
      selectedLabelStyle: TextStyle(
        color: AppColors.backgroundColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
    ),
    bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.lightPrimary),
    scaffoldBackgroundColor: AppColors.backgroundColor,
  );


  static var darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(primary: AppColors.lightPrimary),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.jockeyOne(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.lightPrimary,
      ),

      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.lightPrimary),
    ),

    textTheme: TextTheme(
      bodyLarge: GoogleFonts.jockeyOne(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      titleLarge: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),

      titleMedium: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),

      titleSmall: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.lightPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.inter(
          color: AppColors.backgroundColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightPrimary,
      selectedIconTheme: IconThemeData(
        color: AppColors.backgroundColor,
        size: 33,
      ),
      unselectedIconTheme: IconThemeData(color:Colors.white, size: 27),
      selectedLabelStyle: TextStyle(
        color: AppColors.backgroundColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      unselectedLabelStyle: TextStyle(
        color:Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
    ),

    bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.lightPrimary),
    scaffoldBackgroundColor: AppColors.darkBackground,
  );
}
