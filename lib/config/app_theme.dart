import 'package:auto_food/core/utils/app_colors.dart';
import 'package:auto_food/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: AppColors.primary,
        titleTextStyle: TextStyle(
          color: AppColors.appBarText,
          fontSize: AppFontSize.appBarTitle,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          textStyle: const TextStyle(
            color: AppColors.primary,
            fontSize: AppFontSize.button,
          ),
        ),
      ),
    );
  }
}
