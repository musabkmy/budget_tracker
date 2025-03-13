import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context_extension.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_info.dart';
import 'package:flutter/cupertino.dart';

class BuildSetupTitleSubtitle extends StatelessWidget {
  const BuildSetupTitleSubtitle({
    super.key,
    required this.info,
    this.title,
    this.withTopPadding = true,
  });

  final NewBudgetSetupInfo info;
  final String? title;
  final bool withTopPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: withTopPadding
          ? EdgeInsets.fromLTRB(
              aSpPadding8, aSpPadding24, aSpPadding8, aSpPadding48)
          : EdgeInsets.only(bottom: aSpPadding32),
      child: Text.rich(
        TextSpan(
            text: title ?? info.title,
            style: context.appTextStyles.headline2,
            children: [
              TextSpan(text: '\n'),
              TextSpan(
                text: info.description,
                style: context.appTextStyles.subTitle,
              )
            ]),
        textAlign: TextAlign.center,
      ),
    );
  }
}
