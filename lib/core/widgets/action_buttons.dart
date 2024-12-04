import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/helper/shared.dart';
import 'package:flutter/cupertino.dart';

class AppFilledCupertinoButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const AppFilledCupertinoButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: double.maxFinite,
      child: CupertinoButton.filled(
        borderRadius: buttonBorderRadius,
        onPressed: onPressed,
        child: Text(text, style: context.appTextStyles.action1),
      ),
    );
  }
}

class AppSecondaryCupertinoButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const AppSecondaryCupertinoButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: buttonHeight,
      width: double.maxFinite,
      child: CupertinoButton(
        focusColor: CupertinoColors.transparent,
        disabledColor: CupertinoColors.transparent,
        borderRadius: buttonBorderRadius,
        onPressed: onPressed,
        child: Text(text, style: context.appTextStyles.action2),
      ),
    );
  }
}
