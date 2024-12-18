import 'package:flutter/cupertino.dart';

class AppColors {
  ///buttons,sliders, navigation bar
  CupertinoDynamicColor get primaryColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF131B1D),
        darkColor: CupertinoColors.white,
      );

  ///scaffold,cards,bottom sheets
  CupertinoDynamicColor get scaffoldBackgroundColor =>
      CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.white, // Light mode (optional light alternative)
        darkColor: Color(0xFF131B1D), // Dark mode
      );

  ///on primary color: like text on button
  CupertinoDynamicColor get primaryContrastingColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFFF0F0F0), // Light mode (e.g., blue for contrast)
        darkColor: Color(0xFF282E31), // Dark mode
      );

  ///toolbars,search bars
  CupertinoDynamicColor get barBackgroundColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFFF8F8F8), // Light mode
        darkColor: Color(0xFF282E31), // Dark mode
      );

  CupertinoDynamicColor get neutralShadeColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF3C3C3C),
        darkColor: Color(0xFFCCCECE),
      );
  CupertinoDynamicColor get contrastShadeColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF242424),
        darkColor: CupertinoColors.white.withOpacity(0.6),
      );

  CupertinoDynamicColor get textTitleColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF282E31),
        darkColor: CupertinoColors.white,
      );

  CupertinoDynamicColor get textBodyColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF282E31),
        darkColor: CupertinoColors.white,
      );

  CupertinoDynamicColor get textBody2Color =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFFCCCECE),
        darkColor: Color(0xFFCCCECE),
      );

  CupertinoDynamicColor get textSecondaryActionColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFFBDBFBF),
        darkColor: Color(0xFFBDBFBF),
      );

  CupertinoDynamicColor get budgetDefaultColor =>
      CupertinoDynamicColor.withBrightness(
          color: _darkGreen, darkColor: _darkGreen);

  CupertinoDynamicColor get budgetAccentColor =>
      CupertinoDynamicColor.withBrightness(
          color: _lightGreen, darkColor: _lightGreen);

  CupertinoDynamicColor get partialTransparentColor =>
      CupertinoDynamicColor.withBrightness(
          color: CupertinoColors.white.withOpacity(0.2),
          darkColor: CupertinoColors.white.withOpacity(0.2));

  final Color _darkGreen = Color(0xFF12987C);
  final Color _lightGreen = Color(0xFF30B89B);
}
