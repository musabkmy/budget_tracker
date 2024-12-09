import 'package:flutter/cupertino.dart';

class AppColors {
  ///buttons,sliders, navigation bar
  final CupertinoDynamicColor primaryColor =
      CupertinoDynamicColor.withBrightness(
    color: Color(0xFF131B1D),
    darkColor: CupertinoColors.white,
  );

  ///scaffold,cards,bottom sheets
  final CupertinoDynamicColor scaffoldBackgroundColor =
      CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.white, // Light mode (optional light alternative)
    darkColor: Color(0xFF131B1D), // Dark mode
  );

  ///on primary color: like text on button
  final CupertinoDynamicColor primaryContrastingColor =
      CupertinoDynamicColor.withBrightness(
    color: Color(0xFFF0F0F0), // Light mode (e.g., blue for contrast)
    darkColor: Color(0xFF282E31), // Dark mode
  );

  ///toolbars,search bars
  final CupertinoDynamicColor barBackgroundColor =
      CupertinoDynamicColor.withBrightness(
    color: Color(0xFFF8F8F8), // Light mode
    darkColor: Color(0xFF282E31), // Dark mode
  );

  final CupertinoDynamicColor helper1Color =
      CupertinoDynamicColor.withBrightness(
          color: Color(0xFF3C3C3C), darkColor: Color(0xFFCCCECE));

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
}
