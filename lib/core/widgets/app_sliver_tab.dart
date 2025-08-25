import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context_extension.dart';
import 'package:flutter/cupertino.dart';

class AppSliverTab extends StatelessWidget {
  const AppSliverTab({
    super.key,
    required this.onPressed,
    required this.isPressed,
    required this.title,
  });
  final VoidCallback? onPressed;
  final bool isPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: aSpPadding14),
      onPressed: onPressed,
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: aSpPadding24),
          decoration: BoxDecoration(
              borderRadius: aButtonBorderRadius,
              color: isPressed
                  ? CupertinoTheme.of(context).partialTransparentColor
                  : CupertinoColors.transparent),
          child:
              Text(title.toUpperCase(), style: context.appTextStyles.tabText)),
    );
  }
}
