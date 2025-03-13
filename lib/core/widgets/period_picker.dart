import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context_extension.dart';
import 'package:budget_tracker/core/widgets/drag_handler.dart';
import 'package:budget_tracker/features/budget/data/models/budget_period.dart';
import 'package:flutter/cupertino.dart';

class BudgetPeriodPicker extends StatelessWidget {
  final String title;
  final List<BudgetPeriod> periods;
  final TextEditingController textEditingController;
  final FixedExtentScrollController fixedExtentScrollController;
  final Function(int) onSelectedItemChanged;
  const BudgetPeriodPicker(
      {super.key,
      required this.title,
      required this.periods,
      required this.textEditingController,
      required this.fixedExtentScrollController,
      required this.onSelectedItemChanged});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: aSpPadding82,
          child: CupertinoTextField(
            readOnly: true,
            controller: textEditingController,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                semanticsDismissible: true,
                builder: (context) {
                  return Container(
                    height: context.heigh * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: aBottomSheetRadius,
                      color: CupertinoTheme.of(context).barBackgroundColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DragHandler(),
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          padding: EdgeInsetsDirectional.only(
                              top: aSpPadding8, start: aSpPadding20),
                          child: Text(
                            title.toUpperCase(),
                            textAlign: TextAlign.start,
                            style: context.appTextStyles.fieldTitleGrey,
                          ),
                        ),
                        Expanded(
                          child: CupertinoPicker(
                              itemExtent: aSpPadding42,
                              scrollController: fixedExtentScrollController,
                              onSelectedItemChanged: onSelectedItemChanged,
                              children: periods
                                  .map((element) => Center(
                                        child: Text(element.label,
                                            style: context
                                                .appTextStyles.fieldText),
                                      ))
                                  .toList()),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            style: context.appTextStyles.fieldText,
            textAlignVertical: TextAlignVertical.bottom,
            maxLines: 1,
            padding: EdgeInsetsDirectional.only(
                start: aSpPadding32, bottom: aSpPadding20),
            decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: aEditingFieldRadius),
          ),
        ),
        Positioned.directional(
          start: aSpPadding32,
          top: aSpPadding16,
          textDirection: context.textDirection,
          child: Padding(
            padding: EdgeInsets.only(bottom: aPadding4),
            child: Text(title.toUpperCase(),
                style: context.appTextStyles.fieldTitleGrey),
          ),
        ),
      ],
    );
  }
}
