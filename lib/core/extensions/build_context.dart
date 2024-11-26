import 'package:flutter/widgets.dart';

extension BuildContextExt on BuildContext {
  double get heigh => MediaQuery.sizeOf(this).height;
}
