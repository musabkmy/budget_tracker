import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context_extension.dart';
import 'package:flutter/cupertino.dart';

class AppTextfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final ValueChanged<String> valueChanged;
  const AppTextfield(
      {super.key,
      required this.title,
      required this.controller,
      required this.valueChanged});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: aSpPadding82,
          child: CupertinoTextField(
            // Disables text selection handles
            // enableInteractiveSelection: false,
            // inputFormatters: [
            //Blocks pasting
            //   FilteringTextInputFormatter.deny(RegExp(r'.*')),
            // ],
            controller: controller,
            onChanged: valueChanged,
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
