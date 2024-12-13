import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

///must have finite width in parent
class FlexibleDots extends StatelessWidget {
  final double dotSize; // Size of each dot
  final double spacing; // Spacing between dots

  const FlexibleDots({super.key, this.dotSize = 4.0, this.spacing = 4.0});

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
                color: CupertinoTheme.of(context).neutralShadeColor,
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      },
    );
  }
}
