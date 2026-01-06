import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static var lightTheme = ThemeData(
    colorScheme: ColorScheme.light(primary: AppColors.lightPrimary),

    focusColor: AppColors.backgroundColor,
    indicatorColor: Colors.grey,
    hintColor: Colors.grey,
    iconTheme: IconThemeData(color: AppColors.black),
   dividerColor: AppColors.backgroundColor,


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
        color: AppColors.black,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),

      bodyMedium: GoogleFonts.inter(
        color: AppColors.lightPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodySmall: GoogleFonts.inter(
        color: AppColors.black,
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
        fontWeight: FontWeight.w500,
      ),
      hintStyle: GoogleFonts.inter(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.all(16.0),
      fillColor:Colors.grey,
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
      selectedItemColor: AppColors.backgroundColor,
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: AppColors.backgroundColor,
        size: 33,
      ),
      unselectedIconTheme: IconThemeData(color: AppColors.black, size: 27),
      selectedLabelStyle: TextStyle(
        color: AppColors.backgroundColor,
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.black,
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightPrimary,
      foregroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(75),
        side: BorderSide(color: AppColors.backgroundColor, width: 5),
      ),
    ),

    bottomAppBarTheme: BottomAppBarThemeData(
        color: AppColors.lightPrimary,
        elevation: 0,
    ),

    scaffoldBackgroundColor: AppColors.backgroundColor,
  );

//------------------------------------------------------------------------
  static var darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkBackground,
    ),
    focusColor: AppColors.lightPrimary,
    indicatorColor: AppColors.backgroundColor,
    hintColor: AppColors.backgroundColor,
    iconTheme: IconThemeData(color: AppColors.backgroundColor),
    dividerColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      surfaceTintColor: Colors.transparent,

      titleTextStyle: GoogleFonts.jockeyOne(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.lightPrimary,
      ),

      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.backgroundColor),
    ),

    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        color: AppColors.backgroundColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      bodyMedium: GoogleFonts.inter(
        color: AppColors.backgroundColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodySmall: GoogleFonts.inter(
        color: AppColors.backgroundColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),

      titleLarge: GoogleFonts.inter(
        color: AppColors.backgroundColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),

      titleMedium: GoogleFonts.inter(
        color: AppColors.backgroundColor,
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
        borderSide: BorderSide(color: AppColors.lightPrimary),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.lightPrimary),
      ),
      labelStyle: GoogleFonts.inter(
        color: AppColors.backgroundColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: GoogleFonts.inter(
        color: AppColors.backgroundColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.all(16.0),
      fillColor: AppColors.backgroundColor,
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
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColors.backgroundColor,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: AppColors.backgroundColor,
        size: 33,
      ),
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 27),
      selectedLabelStyle: TextStyle(
        color: AppColors.backgroundColor,
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(75),
      side: BorderSide(color: AppColors.backgroundColor, width: 5),
      ),
    ),

    bottomAppBarTheme: BottomAppBarThemeData(
        color: AppColors.darkBackground,
    ),

    scaffoldBackgroundColor: AppColors.darkScaffold,
  );
}
