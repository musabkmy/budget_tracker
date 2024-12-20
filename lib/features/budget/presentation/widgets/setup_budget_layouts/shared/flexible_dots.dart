import 'package:flutter/cupertino.dart';

///must have finite width in parent
class FlexibleDots extends StatelessWidget {
  final double dotSize;
  final double spacing;
  final bool lightOpacity;

  const FlexibleDots(
      {super.key,
      this.dotSize = 2.0,
      this.spacing = 8.0,
      required this.lightOpacity});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Total width available
        double totalWidth = constraints.maxWidth;

        // Calculate the number of dots that fit within the available width
        int dotCount = (totalWidth / (dotSize + spacing)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(dotCount, (index) {
            return Container(
              width: dotSize,
              height: dotSize,
              margin:
                  EdgeInsets.only(right: index < dotCount - 1 ? spacing : 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CupertinoTheme.of(context)
                    .primaryColor
                    .withOpacity(lightOpacity ? .3 : .5),
              ),
            );
          }),
        );
      },
    );
  }
}
