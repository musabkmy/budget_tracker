import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:flutter/cupertino.dart';

class BuildBottomFieldDescription extends StatelessWidget {
  const BuildBottomFieldDescription({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(aSpPadding20),
      padding: EdgeInsets.all(aSpPadding20),
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        borderRadius: aEditingFieldRadius,
      ),
      child: child,
    );
  }
}
