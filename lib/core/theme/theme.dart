import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffold background color
    scaffoldBackgroundColor: AppColors.background,
    //appBar theme
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background, centerTitle: true),
    //text theme
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          fontSize: 32,
        ),
        displayMedium: TextStyle(
            fontWeight: FontWeight.bold, color: AppColors.white, fontSize: 16),
        displaySmall: TextStyle(
          fontSize: 16,
          color: AppColors.white,
        ),
        ),
    //button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            backgroundColor: AppColors.primary),
        )
  );
}

ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.red,
    //scaffold background color
    scaffoldBackgroundColor: AppColors.background,
    //appBar theme
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background, centerTitle: true),
    //text theme
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          fontSize: 32,
        ),
        displayMedium: TextStyle(
            fontWeight: FontWeight.bold, color: AppColors.white, fontSize: 16),
        displaySmall: TextStyle(
          fontSize: 16,
          color: AppColors.white,
        ),
        ),
    //button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            backgroundColor: AppColors.red),
        )
  );
}
