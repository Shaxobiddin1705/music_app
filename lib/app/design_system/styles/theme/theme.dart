import 'package:flutter/material.dart';
import 'package:music_app/app/design_system/const/app_colors.dart';
import 'package:music_app/app/design_system/styles/text_style/text_style.dart';

mixin MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.mainBackground,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.primaryColor.withOpacity(0.5);
          }
          return AppColors.primaryColor;
        }),
        textStyle: MaterialStateProperty.resolveWith((states) {
          return TextStyleX.styleF16W500.copyWith(
            color: AppColors.textContrast,
          );
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.textSecondary;
          }
          return AppColors.textContrast;
        }),
        minimumSize: MaterialStateProperty.resolveWith((states) {
          return const Size(double.infinity, 48);
        }),
        shape: MaterialStateProperty.resolveWith((states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          );
        }),
      ),
    ),
  );
}
