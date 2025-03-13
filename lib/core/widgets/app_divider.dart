import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    required this.hasFocus,
    required this.hasFocusColor,
    this.noFocusColor,
    required this.indent,
    required this.endIndent,
  });
  final bool hasFocus;
  final Color hasFocusColor;
  final Color? noFocusColor;

  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      endIndent: endIndent,
      height: 1.0,
      thickness: 1.0,
      color: hasFocus
          ? hasFocusColor
          : noFocusColor ?? CupertinoTheme.of(context).neutralShadeColor,
    );
  }
}
