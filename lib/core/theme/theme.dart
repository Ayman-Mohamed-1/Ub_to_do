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

    // *text theme
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
      titleMedium: GoogleFonts.lato(
        fontSize: 24.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: GoogleFonts.lato(
        fontSize: 16.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
    ),

    //* elevated Button theme
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
    iconTheme: IconThemeData(color: AppColors.white),
  );
}

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,
    //appBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
    ),

    // text Theme
    // *text theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        fontSize: 32.sp,
        color: AppColors.background,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 24.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: GoogleFonts.lato(
        fontSize: 16.sp,
        color: AppColors.background,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: GoogleFonts.lato(
        fontSize: 32.sp,
        color: AppColors.background,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.lato(
        fontSize: 24.sp,
        color: AppColors.background,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: GoogleFonts.lato(
        fontSize: 16.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
    ),

    // *text theme
    // *inputDecorationTheme
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
      filled: true,
      // fillColor: AppColors.deepGrey,
      fillColor: AppColors.white,
    ),
    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
    // *inputDecorationTheme
    iconTheme: IconThemeData(color: AppColors.white),
  );
}
