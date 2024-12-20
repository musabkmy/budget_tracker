import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/widgets/app_divider.dart';
import 'package:budget_tracker/features/budget/presentation/providers/create_budget_popup_appearance_provider.dart';
import 'package:budget_tracker/core/providers/editing_numeric_field_provider.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/core/widgets/app_circular_avatar.dart';
import 'package:budget_tracker/features/budget/data/models/budget_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BuildSetupBudgetCategoryLayout extends StatelessWidget {
  final BudgetCategory budgetCategory;
  final FocusNode focusNode;
  // final TextEditingController textEditingController;
  const BuildSetupBudgetCategoryLayout({
    super.key,
    required this.budgetCategory,
    // required this.textEditingController,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final appearanceProvider =
        Provider.of<CreateBudgetPopupAppearanceProvider>(context);
    final editingNumericFieldProvider =
        Provider.of<EditingNumericFieldProvider>(context);
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
            onTap: () {
              //initialize editing provider to save field value instantly
              editingNumericFieldProvider.initInstance(
                  id: budgetCategory.id,
                  initValue: budgetCategory.plannedBalance);
            },
            // controller: textEditingController,
            // won't work because we are using a custom keyboard
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(plannedBalanceFieldLengthLimit),
            // ],
            //value will be visible in suffix
            style: TextStyle(color: CupertinoColors.transparent),
            keyboardType: TextInputType.none,
            cursorWidth: 0,
            decoration: BoxDecoration(
              color: appearanceProvider.fieldKey == budgetCategory.id
                  ? CupertinoTheme.of(context).barBackgroundColor
                  : appearanceProvider.popupBackgroundColor,
            ),
            prefix: _BuildPrefix(budgetCategory: budgetCategory),
            suffix: _BuildSuffix(
                editingNumericFieldProvider: editingNumericFieldProvider,
                budgetCategory: budgetCategory),
          ),
        ),
        AppDivider(
            hasFocus: appearanceProvider.fieldKey == budgetCategory.id,
            hasFocusColor: appearanceProvider.popupBackgroundColor,
            indent: aSpPadding16,
            endIndent: aSpPadding16)
      ],
    );
  }
}

class _BuildSuffix extends StatelessWidget {
  const _BuildSuffix({
    required this.editingNumericFieldProvider,
    required this.budgetCategory,
  });

  final EditingNumericFieldProvider editingNumericFieldProvider;
  final BudgetCategory budgetCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: aPriceButtonRadius,
        color: CupertinoTheme.of(context).neutralShadeColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: aSpPadding4,
        horizontal: aSpPadding16,
      ),
      child: Text(
        editingNumericFieldProvider.isFieldId(budgetCategory.id)
            ? 'US\$ ${editingNumericFieldProvider.value}'
            : 'US\$ ${budgetCategory.plannedBalance.priceFormat}',
        style: context.appTextStyles.fieldText,
      ),
    );
  }
}

class _BuildPrefix extends StatelessWidget {
  const _BuildPrefix({
    required this.budgetCategory,
  });

  final BudgetCategory budgetCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppCircularAvatar(theme: budgetCategory.theme),
        Text(
          budgetCategory.localizedNames
              .getLocalized(Localizations.localeOf(context).languageCode),
          style: context.appTextStyles.fieldText,
        ),
      ],
    );
  }
}
