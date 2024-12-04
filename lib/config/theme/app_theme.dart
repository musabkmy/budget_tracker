import 'package:budget_tracker/config/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

CupertinoThemeData get appTheme => appDarkTheme;

final appColors = AppColors();
CupertinoThemeData appDarkTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  applyThemeToAll: true,
  primaryColor: appColors.primaryColor,
  scaffoldBackgroundColor: appColors.scaffoldBackgroundColor,
  primaryContrastingColor: appColors.primaryContrastingColor,
  barBackgroundColor: appColors.barBackgroundColor,
);
