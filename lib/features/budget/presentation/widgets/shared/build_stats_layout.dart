import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/features/budget/data/models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/shared/flexible_dots.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class BuildStatsLayout extends StatelessWidget {
  const BuildStatsLayout({
    super.key,
    required this.headCategories,
    required this.totalIncomeAndPlannedExpenses,
    this.fromViewBudget = false,
    this.shrinkWrap = false,
  });
  final List<BudgetHeadCategory> headCategories;
  final (double, double) totalIncomeAndPlannedExpenses;
  final bool fromViewBudget;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return ListView(
        shrinkWrap: shrinkWrap,
        padding: EdgeInsets.only(top: fromViewBudget ? 0 : aSpPadding24),
        children: _buildStatsLayout(context, appLocalizations, fromViewBudget,
            headCategories, totalIncomeAndPlannedExpenses));
  }
}

List<Widget> _buildStatsLayout(
  BuildContext context,
  AppLocalizations appLocalizations,
  bool fromViewBudget,
  List<BudgetHeadCategory> headCategories,
  (double, double) totalIncomeAndPlannedExpenses,
) {
  return <Widget>[
        _BuildTotalPlanningLayout(
          headCategories: headCategories,
          totalIncomeAndPlannedExpenses: totalIncomeAndPlannedExpenses,
          appLocalizations: appLocalizations,
          fromViewBudget: fromViewBudget,
        ),
      ] +
      headCategories
          .skip(fromViewBudget ? 1 : 0)
          .toList()
          .asMap()
          .entries
          .map((element) {
        final name = element.value.localizedNames
            .getLocalized(appLocalizations.localeName);
        final totalPlannedBalance = 'US\$${element.value.totalPlannedBalance}';
        return (element.key == 0 || fromViewBudget) &&
                element.value.totalPlannedBalance == 0
            ? SizedBox()
            : _BuildHeadCategoryPlannedExpense(
                name: name,
                totalPlannedBalance: totalPlannedBalance,
                headCategoryColor: fromViewBudget
                    ? CupertinoTheme.of(context)
                        .budgetAccentColor
                        .withOpacity(1 - (element.key * (2 / 10)))
                    : element.value.headCategoryColor,
                isHeadCategoryViewed: true,
              );
      }).toList();
}

class _BuildTotalPlanningLayout extends StatelessWidget {
  const _BuildTotalPlanningLayout({
    required this.headCategories,
    required this.totalIncomeAndPlannedExpenses,
    required this.appLocalizations,
    required this.fromViewBudget,
  });

  final List<BudgetHeadCategory> headCategories;
  final (double, double) totalIncomeAndPlannedExpenses;
  final AppLocalizations appLocalizations;
  final bool fromViewBudget;

  @override
  Widget build(BuildContext context) {
    return totalIncomeAndPlannedExpenses.$1 == 0 &&
            totalIncomeAndPlannedExpenses.$2 == 0
        ? Padding(
            padding: EdgeInsetsDirectional.only(
                start: aSpPadding32, bottom: aSpPadding12),
            child: _BuildTotalPlannedExpensesLayout(
              appLocalizations: appLocalizations,
              totalIncomeAndPlannedExpenses: totalIncomeAndPlannedExpenses,
              fromViewBudget: false,
            ),
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
                        totalIncomeAndPlannedExpenses,
                    fromViewBudget: fromViewBudget,
                  ),
                ),
                SizedBox(width: fromViewBudget ? aSpPadding24 : aSpPadding8),
                Expanded(
                    flex: 2,
                    child: _BuildTotalPlannedExpensesLayout(
                      appLocalizations: appLocalizations,
                      totalIncomeAndPlannedExpenses:
                          totalIncomeAndPlannedExpenses,
                      fromViewBudget: fromViewBudget,
                    ))
              ],
            ),
          );
  }
}

class _BuildTotalPlannedExpensesLayout extends StatelessWidget {
  const _BuildTotalPlannedExpensesLayout({
    required this.appLocalizations,
    required this.totalIncomeAndPlannedExpenses,
    required this.fromViewBudget,
  });

  final AppLocalizations appLocalizations;
  final (double, double) totalIncomeAndPlannedExpenses;
  final bool fromViewBudget;

  @override
  Widget build(BuildContext context) {
    final totalPlannedIncome = totalIncomeAndPlannedExpenses.$1;
    final totalPlannedExpenses = totalIncomeAndPlannedExpenses.$2;

    return Text.rich(
      TextSpan(
          text: appLocalizations.totalPlannedExpenses.toUpperCase(),
          style: context.appTextStyles.captionNormal,
          children: [
            TextSpan(
              text: '\nUS\$ ${totalPlannedExpenses.priceFormat}',
              style: fromViewBudget
                  ? context.appTextStyles.largeBody
                  : context.appTextStyles.headline2,
            ),
            fromViewBudget
                ? TextSpan(
                    text:
                        '\nUS\$ ${(totalPlannedIncome - totalPlannedExpenses).abs().priceFormat} ',
                    style: context.appTextStyles.bodyBold,
                    children: [
                        TextSpan(
                          text: totalPlannedExpenses <= totalPlannedIncome
                              ? appLocalizations.leftOfIncomeLabel
                              : totalPlannedIncome == 0
                                  ? appLocalizations.plannedExpensesLabel
                                  : appLocalizations.overIncomeLabel,
                          style: context.appTextStyles.bodyNormal,
                        ),
                      ])
                : TextSpan(),
          ]),
    );
  }
}

class _BuildPieChartLayout extends StatelessWidget {
  const _BuildPieChartLayout({
    required this.headCategories,
    required this.totalIncomeAndPlannedExpenses,
    required this.fromViewBudget,
  });

  final List<BudgetHeadCategory> headCategories;
  final (double, double) totalIncomeAndPlannedExpenses;
  final bool fromViewBudget;

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
          .toList()
          .asMap()
          .entries
          .map((element) => PieChartSectionData(
                radius: 16,
                badgeWidget: AnimatedOpacity(
                    opacity: .2, duration: Duration(seconds: 1)),
                showTitle: false,
                value: element.value.totalPlannedBalance,
                color: element.key == 0
                    ? CupertinoTheme.of(context).scaffoldBackgroundColor
                    : fromViewBudget
                        ? CupertinoTheme.of(context)
                            .budgetAccentColor
                            .withOpacity(1 - (element.key * (2 / 10)))
                        : element.value.headCategoryColor,
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
      padding: EdgeInsets.symmetric(
          vertical: aSpPadding12, horizontal: aSpPadding24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
                width: context.width - aSpPadding32 * 2,
                child: FlexibleDots(lightOpacity: !isHeadCategoryViewed)),
          ),
          Row(
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
        ],
      ),
    );
  }
}
