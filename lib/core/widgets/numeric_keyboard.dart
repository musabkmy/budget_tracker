import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context_extension.dart';
import 'package:budget_tracker/core/providers/editing_numeric_field_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NumericKeyboard extends StatelessWidget {
  final String label;
  // final Function(String) onKeyPressed;
  final Function() onDonePressed;
  // final Function() onRemovePressed;

  const NumericKeyboard({
    super.key,
    required this.label,
    // required this.onKeyPressed,
    required this.onDonePressed,
    // required this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    final editingNumericFieldProvider =
        Provider.of<EditingNumericFieldProvider>(context);

    return editingNumericFieldProvider.isInit
        ? Container(
            height: context.heigh * 0.4,
            width: context.width,
            color: CupertinoTheme.of(context).barBackgroundColor,
            child: Column(
              children: [
                BuildTopKeyboard(
                  label: label,
                  onDonePressed: onDonePressed,
                ),
                BuildKeyboardLayout(),
              ],
            ),
          )
        : SizedBox();
  }
}

class BuildTopKeyboard extends StatelessWidget {
  const BuildTopKeyboard({
    super.key,
    required this.label,
    required this.onDonePressed,
  });

  final String label;
  final Function() onDonePressed;

  @override
  Widget build(BuildContext context) {
    final editingNumericFieldProvider =
        Provider.of<EditingNumericFieldProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: aSpPadding20, vertical: aSpPadding12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label.toUpperCase(),
            style: context.appTextStyles.fieldTitleGrey,
          ),
          GestureDetector(
              onTap: () {
                onDonePressed();

                editingNumericFieldProvider.doneEditing();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.transparent,
                ),
                child: Center(
                  child: Text(
                    '✓',
                    style: context.appTextStyles.action1.copyWith(
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class BuildKeyboardLayout extends StatelessWidget {
  const BuildKeyboardLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.0,
      ),
      itemCount: 12, // 9 number keys + 3 action keys (e.g., backspace, done)
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

        return BuildKeyboardItem(keyLabel: keyLabel);
      },
    );
  }
}

class BuildKeyboardItem extends StatelessWidget {
  const BuildKeyboardItem({
    super.key,
    required this.keyLabel,
  });

  final String keyLabel;

  @override
  Widget build(BuildContext context) {
    final editingNumericFieldProvider =
        Provider.of<EditingNumericFieldProvider>(context);

    return GestureDetector(
      onTap: () => keyLabel == '⇤'
          ? editingNumericFieldProvider.removeValue()
          : editingNumericFieldProvider.hasDot && keyLabel == '.'
              ? () {}
              : editingNumericFieldProvider.addValue(keyLabel),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.transparent,
        ),
        child: Center(
          child: Text(
            keyLabel,
            style: TextStyle(
                color: editingNumericFieldProvider.hasDot && keyLabel == '.'
                    ? CupertinoTheme.of(context).neutralShadeColor
                    : CupertinoColors.white,
                fontSize: keyLabel == '⇤' ? 28 : 24),
          ),
        ),
      ),
    );
  }
}
