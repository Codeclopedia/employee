import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppThemes {
  AppThemes._();
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(color: AppColors.primaryColor),
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.primaryColor,
  );
}
