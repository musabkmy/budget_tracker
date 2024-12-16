import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:flutter/cupertino.dart';

class AppFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool withBottomPadding;
  const AppFilledButton(
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

class AppTextButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool withoutPadding;
  final Widget? child;

  ///text must be provided or child must be declared

  const AppTextButton({
    super.key,
    this.text,
    required this.onPressed,
    this.withoutPadding = false,
    this.child,
  }) : assert(child != null || text != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: aButtonHeight,
      width: double.maxFinite,
      child: CupertinoButton(
        padding: withoutPadding
            ? EdgeInsetsDirectional.zero
            : EdgeInsetsDirectional.all(aSpPadding12),
        focusColor: CupertinoColors.transparent,
        disabledColor: CupertinoColors.transparent,
        borderRadius: aButtonBorderRadius,
        onPressed: onPressed,
        child: child ?? Text(text!, style: context.appTextStyles.action2),
      ),
    );
  }
}
