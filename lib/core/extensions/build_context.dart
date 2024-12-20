import 'package:budget_tracker/config/theme/app_text_styles.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExt on BuildContext {
  double get heigh => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  TextDirection get textDirection => Directionality.of(this);
  AppTextStyles get appTextStyles => AppTextStyles(this);
}
