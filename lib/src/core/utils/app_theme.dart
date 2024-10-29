import 'package:ecommerce_app/src/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
    primaryColorLight: AppColors.primaryVariantLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      surface: AppColors.surfaceLight,
      error: AppColors.errorLight,
      onPrimary: AppColors.onPrimaryLight,
      onSecondary: AppColors.onSecondaryLight,
      onSurface: AppColors.onSurfaceLight,
      onError: AppColors.onErrorLight,
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: AppColors.surfaceLight,
      color: AppColors.surfaceLight,
      titleTextStyle: TextStyle(
        color: AppColors.onPrimaryLight,
        fontFamily: AppStrings.fontFamily,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: AppColors.onPrimaryLight),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryLight,
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primaryLight),
      ),
      labelStyle: const TextStyle(color: AppColors.onBackgroundLight, fontFamily: 'Roboto'),
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryLight),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(color: AppColors.onBackgroundLight, fontFamily: 'Roboto'),
      bodyMedium: TextStyle(color: AppColors.onBackgroundLight.withOpacity(0.6), fontFamily: 'Roboto'),
      titleLarge: const TextStyle(color: AppColors.onBackgroundLight, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryVariantDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      surface: AppColors.surfaceDark,
      error: AppColors.errorDark,
      onPrimary: AppColors.onPrimaryDark,
      onSecondary: AppColors.onSecondaryDark,
      onSurface: AppColors.onSurfaceDark,
      onError: AppColors.onErrorDark,
    ),
    appBarTheme: const AppBarTheme(
       surfaceTintColor: AppColors.surfaceDark,
      titleTextStyle: TextStyle(
        color: AppColors.onPrimaryDark,
        fontFamily: AppStrings.fontFamily,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: AppColors.onPrimaryDark),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryDark,
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primaryDark),
      ),
      labelStyle: const TextStyle(color: AppColors.onBackgroundDark, fontFamily: 'Roboto'),
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryDark),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(color: AppColors.onBackgroundDark, fontFamily: 'Roboto'),
      bodyMedium: TextStyle(color: AppColors.onBackgroundDark.withOpacity(0.6), fontFamily: 'Roboto'),
      titleLarge: const TextStyle(color: AppColors.onBackgroundDark, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    ),
  );
}
