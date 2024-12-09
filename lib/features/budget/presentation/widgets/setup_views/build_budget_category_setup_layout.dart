import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/providers/appearance_provider.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/core/widgets/app_circular_avatar.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BuildBudgetCategorySetupLayout extends StatelessWidget {
  final BudgetCategory budgetCategory;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  const BuildBudgetCategorySetupLayout({
    super.key,
    required this.budgetCategory,
    required this.textEditingController,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final appearanceProvider = Provider.of<AppearanceProvider>(context);
    return Column(
      children: [
        Container(
          key: ValueKey(budgetCategory.id),
          decoration: BoxDecoration(
              color: appearanceProvider.fieldKey == budgetCategory.id
                  ? CupertinoTheme.of(context).barBackgroundColor
                  : appearanceProvider.popupBackgroundColor,
              borderRadius: aPriceButtonRadius),
          padding: EdgeInsets.symmetric(
              horizontal: aSpPadding16, vertical: aSpPadding12),
          child: CupertinoTextField(
            focusNode: focusNode,
            controller: textEditingController,
            // won't work because we are using a custom keyboard
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(plannedBalanceFieldLengthLimit),
            // ],
            style: TextStyle(color: CupertinoColors.transparent),
            keyboardType: TextInputType.none,
            cursorWidth: 0,
            decoration: BoxDecoration(
              color: appearanceProvider.fieldKey == budgetCategory.id
                  ? CupertinoTheme.of(context).barBackgroundColor
                  : appearanceProvider.popupBackgroundColor,
            ),
            prefix: Row(
              children: [
                AppCircularAvatar(theme: budgetCategory.theme),
                Text(
                  budgetCategory.localizedNames.getLocalized(
                      Localizations.localeOf(context).languageCode),
                  style: context.appTextStyles.fieldText,
                ),
              ],
            ),
            suffix: Container(
              height: 38.0.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: aPriceButtonRadius,
                color: CupertinoTheme.of(context).helper1Color,
              ),
              padding: EdgeInsets.symmetric(
                vertical: aSpPadding4,
                horizontal: aSpPadding16,
              ),
              child: Text(
                'US\$ ${textEditingController.text}',
                style: context.appTextStyles.fieldText,
              ),
            ),
          ),
        ),
        Divider(
          indent: aSpPadding16,
          endIndent: aSpPadding16,
          height: 1.0,
          thickness: 1.0,
          color: appearanceProvider.fieldKey == budgetCategory.id
              ? appearanceProvider.popupBackgroundColor
              : CupertinoTheme.of(context).helper1Color,
        )
      ],
    );
  }
}
