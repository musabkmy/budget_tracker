import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:flutter/cupertino.dart';

class NumericKeyboard extends StatelessWidget {
  final String label;
  final Function(String) onKeyPressed;
  final Function() onDonePressed;
  final Function() onRemovePressed;

  const NumericKeyboard({
    super.key,
    required this.label,
    required this.onKeyPressed,
    required this.onDonePressed,
    required this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heigh * 0.4,
      width: context.width,
      color: CupertinoTheme.of(context).barBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: aSpPadding20, vertical: aSpPadding12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label.toUpperCase(),
                  style: context.appTextStyles.fieldTitle,
                ),
                GestureDetector(onTap: onDonePressed, child: _buildItem('✓')),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.0,
            ),
            itemCount:
                12, // 9 number keys + 3 action keys (e.g., backspace, done)
            itemBuilder: (context, index) {
              late String keyLabel;
              // Define the key labels for the number pad
              if (index < 9) {
                keyLabel = (index + 1).toString();
              } else if (index == 9) {
                keyLabel = '.';
              } else if (index == 10) {
                keyLabel = '0';
              } else if (index == 11) {
                keyLabel = '⇤';
              }

              return GestureDetector(
                onTap: () => keyLabel == '⇤'
                    ? onRemovePressed()
                    : onKeyPressed(keyLabel),
                child: _buildItem(keyLabel),
              );
            },
          ),
        ],
      ),
    );
  }

  Container _buildItem(String keyLabel) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.transparent,
      ),
      child: Center(
        child: Text(
          keyLabel,
          style: TextStyle(
              color: CupertinoColors.white,
              fontSize: keyLabel == '⇤' ? 28 : 24),
        ),
      ),
    );
  }
}
