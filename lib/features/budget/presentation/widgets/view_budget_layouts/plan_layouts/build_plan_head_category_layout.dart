import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context_extension.dart';
import 'package:budget_tracker/core/providers/focus_nodes_manager_provider.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/core/widgets/app_divider.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/view_budget_layouts/plan_layouts/build_plan_budget_category_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BuildPlanHeadCategory extends StatelessWidget {
  const BuildPlanHeadCategory({super.key, required this.budgetHeadCategoryKey});
  final String budgetHeadCategoryKey;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<GetBudgetBloc, GetBudgetState>(
        builder: (context, state) {
      final budget = state.budget;
      if (budget != null &&
          budget.headCategories.containsKey(budgetHeadCategoryKey)) {
        final headCategory = budget.headCategories[budgetHeadCategoryKey]!;
        return Consumer<FocusNodesManagerProvider>(
            builder: (context, provider, name) {
          return Container(
            key: ValueKey(headCategory.id),
            // key: Key(headCategory.id),
            padding: EdgeInsets.all(aSpPadding24),
            margin: EdgeInsets.only(bottom: aSpPadding24),
            decoration: BoxDecoration(
                borderRadius: aCardRadius,
                color: CupertinoTheme.of(context).barBackgroundColor),
            child: Column(
              spacing: aSpPadding8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headCategory.localizedNames
                      .getLocalized(appLocalizations.localeName),
                  style: context.appTextStyles.largeBody,
                ),
                AppDivider(
                    hasFocus: false,
                    hasFocusColor: CupertinoColors.transparent,
                    indent: 0,
                    endIndent: 0),
                Column(
                  children: headCategory.categoriesId.map((categoryKey) {
                    if (budget.categories.containsKey(categoryKey)) {
                      final FocusNode focusNode =
                          FocusNode(debugLabel: categoryKey);
                      context
                          .read<FocusNodesManagerProvider>()
                          .addFocusNode(categoryKey, focusNode);
                      return BuildPlanBudgetCategoryLayout(
                          budgetCategory: budget.categories[categoryKey]!,
                          focusNode: focusNode);
                    } else {
                      return SizedBox();
                    }
                  }).toList(),
                ),
              ],
            ),
          );
        });
      }
      return SizedBox();
    });
  }
}
