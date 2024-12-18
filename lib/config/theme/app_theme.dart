import 'package:budget_tracker/config/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

// CupertinoThemeData get appTheme => appDarkTheme;

CupertinoThemeData appTheme({required Brightness brightness}) =>
    CupertinoThemeData(
      brightness: brightness,
      primaryColor: AppColors().primaryColor,
      scaffoldBackgroundColor: AppColors().scaffoldBackgroundColor,
      primaryContrastingColor: AppColors().primaryContrastingColor,
      barBackgroundColor: AppColors().barBackgroundColor,
    );

extension CupertinoThemeDataExt on CupertinoThemeData {
  CupertinoDynamicColor get neutralShadeColor => AppColors().neutralShadeColor;
  CupertinoDynamicColor get contrastShadeColor =>
      AppColors().contrastShadeColor;
  CupertinoDynamicColor get budgetColor => AppColors().budgetDefaultColor;
  CupertinoDynamicColor get budgetAccentColor => AppColors().budgetAccentColor;
  CupertinoDynamicColor get partialTransparentColor =>
      AppColors().partialTransparentColor;
}
