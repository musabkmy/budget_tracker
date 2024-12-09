import 'package:budget_tracker/config/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

CupertinoThemeData get appTheme => appDarkTheme;

CupertinoThemeData appDarkTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors().primaryColor,
  scaffoldBackgroundColor: AppColors().scaffoldBackgroundColor,
  primaryContrastingColor: AppColors().primaryContrastingColor,
  barBackgroundColor: AppColors().barBackgroundColor,
);

extension CupertinoThemeDataExt on CupertinoThemeData {
  CupertinoDynamicColor get helper1Color => AppColors().helper1Color;
}
