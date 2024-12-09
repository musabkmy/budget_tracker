import 'package:flutter/cupertino.dart';

class DragHandler extends StatelessWidget {
  const DragHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40, // Width of the handle
      height: 5, // Thickness of the handle
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey, // Color of the handle
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }
}
