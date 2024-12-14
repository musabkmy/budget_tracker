import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/features/budget/data/models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_layouts_info.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/shared/flexible_dots.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class BuildStats extends StatelessWidget {
  const BuildStats({
    super.key,
    required this.currentSetupLayoutInfo,
    required this.headCategories,
    required this.totalIncomeAndPlannedExpenses,
  });
  final BudgetSetupLayoutsInfo currentSetupLayoutInfo;
  final List<BudgetHeadCategory> headCategories;
  final (double, double) totalIncomeAndPlannedExpenses;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(top: aSpPadding24),
        children: <Widget>[
              _BuildTotalPlanningLayout(
                  headCategories: headCategories,
                  totalIncomeAndPlannedExpenses: totalIncomeAndPlannedExpenses,
                  appLocalizations: appLocalizations),
            ] +
            headCategories.asMap().entries.map((element) {
              final name = element.value.localizedNames
                  .getLocalized(appLocalizations.localeName);
              final totalPlannedBalance =
                  'US\$${element.value.totalPlannedBalance}';
              return element.key == 0 && element.value.totalPlannedBalance == 0
                  ? SizedBox()
                  : _BuildHeadCategoryPlannedExpense(
                      name: name,
                      totalPlannedBalance: totalPlannedBalance,
                      headCategoryColor: element.value.headCategoryColor,
                      isHeadCategoryViewed: true,
                    );
            }).toList(),
      ),
    );
  }
}

class _BuildTotalPlanningLayout extends StatelessWidget {
  const _BuildTotalPlanningLayout({
    required this.headCategories,
    required this.totalIncomeAndPlannedExpenses,
    required this.appLocalizations,
  });

  final List<BudgetHeadCategory> headCategories;
  final (double, double) totalIncomeAndPlannedExpenses;
  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    return totalIncomeAndPlannedExpenses.$1 == 0 &&
            totalIncomeAndPlannedExpenses.$2 == 0
        ? Padding(
            padding: EdgeInsetsDirectional.only(
                start: aSpPadding32, bottom: aSpPadding12),
            child: _BuildTotalPlannedExpensesLayout(
                appLocalizations: appLocalizations,
                totalIncomeAndPlannedExpenses: totalIncomeAndPlannedExpenses),
          )
        : Container(
            height: context.heigh * .1,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal: aSpPadding24),
            margin: EdgeInsets.only(bottom: aSpPadding48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: _BuildPieChartLayout(
                      headCategories: headCategories,
                      totalIncomeAndPlannedExpenses:
                          totalIncomeAndPlannedExpenses),
                ),
                SizedBox(width: aSpPadding8),
                Expanded(
                    flex: 2,
                    child: _BuildTotalPlannedExpensesLayout(
                        appLocalizations: appLocalizations,
                        totalIncomeAndPlannedExpenses:
                            totalIncomeAndPlannedExpenses))
              ],
            ),
          );
  }
}

class _BuildTotalPlannedExpensesLayout extends StatelessWidget {
  const _BuildTotalPlannedExpensesLayout({
    super.key,
    required this.appLocalizations,
    required this.totalIncomeAndPlannedExpenses,
  });

  final AppLocalizations appLocalizations;
  final (double, double) totalIncomeAndPlannedExpenses;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: appLocalizations.totalPlannedExpenses.toUpperCase(),
          style: context.appTextStyles.captionNormal,
          children: [
            TextSpan(
              text: '\nUS\$ ${totalIncomeAndPlannedExpenses.$2}',
              style: context.appTextStyles.headline2,
            )
          ]),
    );
  }
}

class _BuildPieChartLayout extends StatelessWidget {
  const _BuildPieChartLayout({
    super.key,
    required this.headCategories,
    required this.totalIncomeAndPlannedExpenses,
  });

  final List<BudgetHeadCategory> headCategories;
  final (double, double) totalIncomeAndPlannedExpenses;

  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(
      centerSpaceRadius: 38,
      sectionsSpace: 0,
      sections: headCategories
          .skip(totalIncomeAndPlannedExpenses.$2 >=
                  totalIncomeAndPlannedExpenses.$1
              ? 1
              : 0)
          .map((element) => PieChartSectionData(
                radius: 16,
                badgeWidget: AnimatedOpacity(
                    opacity: .2, duration: Duration(seconds: 1)),
                showTitle: false,
                value: element.totalPlannedBalance,
                color: element.headCategoryColor,
              ))
          .toList(),
    ));
  }
}

class _BuildHeadCategoryPlannedExpense extends StatelessWidget {
  const _BuildHeadCategoryPlannedExpense({
    required this.name,
    required this.totalPlannedBalance,
    required this.isHeadCategoryViewed,
    required this.headCategoryColor,
  });

  final bool isHeadCategoryViewed;
  final Color headCategoryColor;
  final String name;
  final String totalPlannedBalance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: aSpPadding12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
                width: context.width - aSpPadding32 * 2,
                child: FlexibleDots(lightOpacity: !isHeadCategoryViewed)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: aSpPadding32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: aSpPadding4),
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        margin: EdgeInsetsDirectional.only(end: aSpPadding12),
                        decoration: BoxDecoration(
                            color: isHeadCategoryViewed
                                ? headCategoryColor
                                : CupertinoTheme.of(context)
                                    .scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(4.0)),
                      ),
                      Text(
                        '$name  ',
                        style: context.appTextStyles.fieldText.copyWith(
                          color: isHeadCategoryViewed
                              ? null
                              : CupertinoDynamicColor.resolve(
                                  CupertinoTheme.of(context).contrastShadeColor,
                                  context),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: aSpPadding8),
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  child: Text(
                    totalPlannedBalance,
                    style: context.appTextStyles.fieldText.copyWith(
                        color: isHeadCategoryViewed
                            ? null
                            : CupertinoDynamicColor.resolve(
                                CupertinoTheme.of(context).contrastShadeColor,
                                context)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
