import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      displayLarge: GoogleFonts.lato(
        fontSize: 32.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 24.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: GoogleFonts.lato(
        fontSize: 16.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
    ),

    // elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      // enabledBorder
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(8.r),
      ),
      // focusedBorder
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(8.r),
      ), // hint
      hintStyle: TextStyle(color: AppColors.white),
      filled: true,
      fillColor: AppColors.lightBlack,
    ),
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
        // ignore: deprecated_member_use
        color: AppColors.background.withOpacity(0.44),
        fontSize: 16,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // enabledBorder
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightBlack),
        borderRadius: BorderRadius.circular(8.r),
      ),
      // focusedBorder
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightBlack),
        borderRadius: BorderRadius.circular(8.r),
      ), // hint
      // hintStyle: TextStyle(color: AppColors.white),
      filled: true,
      // fillColor: AppColors.deepGrey,
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
