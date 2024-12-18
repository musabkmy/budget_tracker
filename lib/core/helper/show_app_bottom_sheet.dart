import 'package:flutter/cupertino.dart';

void showCustomCupertinoBottomSheet(BuildContext context,
    {required Widget child}) {
  showCupertinoModalPopup(
    context: context,
    useRootNavigator: false,
    // barrierDismissible: false,
    builder: (BuildContext context) {
      return child;
    },
  );
}
