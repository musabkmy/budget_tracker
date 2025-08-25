import 'package:flutter/cupertino.dart';

class AppColors {
  ///buttons,sliders, navigation bar
  static CupertinoDynamicColor get primaryColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF131B1D),
        darkColor: CupertinoColors.white,
      );

  ///scaffold,cards,bottom sheets
  static CupertinoDynamicColor get scaffoldBackgroundColor =>
      CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.white, // Light mode (optional light alternative)
        darkColor: Color(0xFF131B1D), // Dark mode
      );

  ///on primary color: like text on button
  static CupertinoDynamicColor get primaryContrastingColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFFF0F0F0), // Light mode (e.g., blue for contrast)
        darkColor: Color(0xFF282E31), // Dark mode
      );

  ///toolbars,search bars
  static CupertinoDynamicColor get barBackgroundColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFFF8F8F8), // Light mode
        darkColor: Color(0xFF282E31), // Dark mode
      );

  static CupertinoDynamicColor get neutralShadeColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF3C3C3C),
        darkColor: Color(0xFFCCCECE),
      );
  static CupertinoDynamicColor get contrastShadeColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF242424),
        darkColor: CupertinoColors.white.withOpacity(0.6),
      );

  static CupertinoDynamicColor get textTitleColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF282E31),
        darkColor: CupertinoColors.white,
      );

  static CupertinoDynamicColor get textBodyColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF282E31),
        darkColor: CupertinoColors.white,
      );

  static CupertinoDynamicColor get textBody2Color =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFFCCCECE),
        darkColor: Color(0xFFCCCECE),
      );

  static CupertinoDynamicColor get textSecondaryActionColor =>
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFFBDBFBF),
        darkColor: Color(0xFFBDBFBF),
      );

  static CupertinoDynamicColor get budgetDefaultColor =>
      CupertinoDynamicColor.withBrightness(
          color: _darkGreen, darkColor: _darkGreen);

  static CupertinoDynamicColor get budgetAccentColor =>
      CupertinoDynamicColor.withBrightness(
          color: _lightGreen, darkColor: _lightGreen);

  static CupertinoDynamicColor get partialTransparentColor =>
      CupertinoDynamicColor.withBrightness(
          color: CupertinoColors.white.withValues(alpha: .2),
          darkColor: CupertinoColors.white..withValues(alpha: .2));

  static final Color _darkGreen = Color(0xFF12987C);
  static final Color _lightGreen = Color(0xFF30B89B);
}
