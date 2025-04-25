import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData.light(useMaterial3: true).copyWith(
    dividerColor: AppColors.transparent,
    scaffoldBackgroundColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actionsIconTheme: const IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: AppColors.primary,
      elevation: 0,
      foregroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
    ),
    primaryColor: AppColors.primary,
    indicatorColor: AppColors.secondary,
    hintColor: AppColors.black.withOpacity(0.5),
    colorScheme: ColorScheme.dark(
      primary: AppColors.secondary,
    ),
    textTheme: appTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.black,),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.black),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        focusColor: AppColors.transparent,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        activeIndicatorBorder: BorderSide(
          color: AppColors.black,
        ),
      ),
    ),
  );
}

TextTheme appTextTheme = const TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    fontSize: 32,
    color: Colors.black,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.black,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.black,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: Colors.black,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.black87,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black87,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: Colors.black87,
  ),
);
