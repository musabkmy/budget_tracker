import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/models/item_theme.dart';
import 'package:flutter/cupertino.dart';

class AppCircularAvatar extends StatelessWidget {
  final ItemTheme theme;
  final double radius;

  const AppCircularAvatar({
    super.key,
    required this.theme,
    this.radius = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: aSpPadding12),
      child: ClipOval(
        child: Container(
          width: radius * 2,
          height: radius * 2,
          color: theme.color,
          alignment: Alignment.center,
          child: Icon(theme.icon, size: radius),
        ),
      ),
    );
  }
}
