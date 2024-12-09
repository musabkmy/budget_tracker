import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:flutter/cupertino.dart';

class AppFilledCupertinoButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool withBottomPadding;
  const AppFilledCupertinoButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.withBottomPadding = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: aButtonHeight,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: aSpPadding24)
          .copyWith(bottom: withBottomPadding ? aSpPadding20 : 0),
      child: CupertinoButton.filled(
        borderRadius: aButtonBorderRadius,
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
      height: aButtonHeight,
      width: double.maxFinite,
      child: CupertinoButton(
        focusColor: CupertinoColors.transparent,
        disabledColor: CupertinoColors.transparent,
        borderRadius: aButtonBorderRadius,
        onPressed: onPressed,
        child: Text(text, style: context.appTextStyles.action2),
      ),
    );
  }
}
