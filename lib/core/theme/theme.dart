import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:up_to_do/core/utils/app_colors.dart';

ThemeData DarkTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    // backgrond
    scaffoldBackgroundColor: AppColors.background,
    // appBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),
    // text Theme
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.lato(
        fontSize: 32,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: GoogleFonts.lato(
        fontSize: 24,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: GoogleFonts.lato(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
    ),

    // elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      // enabledBorder
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      // focusedBorder
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      // hint
      hintStyle: GoogleFonts.lato(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor: AppColors.lightBlack,
    ),
    //
  );
}

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,
    //appBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        color: AppColors.background,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      displayMedium: GoogleFonts.lato(
        color: AppColors.background,
        fontSize: 16,
      ),
      displaySmall: GoogleFonts.lato(
        color: AppColors.background.withOpacity(0.44),
        fontSize: 16,
      ),
    ),
    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
  );
}
