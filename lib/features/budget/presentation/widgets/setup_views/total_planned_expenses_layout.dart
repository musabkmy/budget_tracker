import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/data/models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_layouts_info.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/shared/build_bottom_field_description.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/shared/flexible_dots.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalPlannedExpensesLayout extends StatelessWidget {
  const TotalPlannedExpensesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<CreateBudgetBloc, CreateBudgetState>(
      //to not listen to next head category been pressed and
      //changing the layout before transiting to next page
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        final stateModifiable = state.createBudgetStatus;
        final currentSetupLayoutInfo = state.currentSetupLayoutInfo;

        if (stateModifiable is CreateBudgetStatusModifiable &&
            currentSetupLayoutInfo.headBudgetIndex != null) {
          // AppLocalizations appLocalizations = AppLocalizations.of(context)!;
          // final setupInfo = state.getNewBudgetSetupInfo(appLocalizations);
          final headCategories =
              stateModifiable.budget.headCategories.values.toList();
          final setupInfo = state.getNewBudgetSetupInfo(appLocalizations);
          final nextEntry = setupInfo.entries
              .elementAt(state.currentSetupLayoutInfo.nexHeadCategoryIndex + 1)
              .key;
          final currentEntry = setupInfo.entries
              .elementAt(state.currentSetupLayoutInfo.nexHeadCategoryIndex);
          final nextUp = currentEntry.value.nextUp;

          return Container(
            height: context.heigh * .8,
            color: CupertinoTheme.of(context).barBackgroundColor,
            child: Stack(
              children: [
                SizedBox(
                  height: context.heigh * .7,
                  child: Column(
                    children: [
                      //actual stats
                      _BuildStats(
                        currentSetupLayoutInfo: state.currentSetupLayoutInfo,
                        headCategories: headCategories,
                        totalPlannedExpenses:
                            stateModifiable.budget.getTotalPlannedExpenses(),
                      ),
                      //next up Description if existed
                      nextUp != null
                          ? BuildBottomFieldDescription(
                              child: Text.rich(TextSpan(
                                  text:
                                      '${appLocalizations.nextUpHeadCategoryLabel(nextEntry).toUpperCase()}\n\n',
                                  style: context.appTextStyles.fieldTitleBrighter,
                                  children: [
                                    TextSpan(
                                        text: nextUp,
                                        style: context.appTextStyles.fieldText)
                                  ])),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                //to next head category btn
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AppFilledCupertinoButton(
                      text: appLocalizations.continueLabel,
                      onPressed: () {
                        context
                            .read<CreateBudgetBloc>()
                            .add(FromStatsToNextHeadCategory());
                      }),
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class _BuildStats extends StatelessWidget {
  const _BuildStats({
    required this.currentSetupLayoutInfo,
    required this.headCategories,
    required this.totalPlannedExpenses,
  });
  final BudgetSetupLayoutsInfo currentSetupLayoutInfo;
  final List<BudgetHeadCategory> headCategories;
  final double totalPlannedExpenses;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(top: aSpPadding24),
        children: <Widget>[
              Container(
                height: context.heigh * .1,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(horizontal: aSpPadding24),
                margin: EdgeInsets.only(bottom: aSpPadding48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: PieChart(PieChartData(
                        centerSpaceRadius: 38,
                        sectionsSpace: 0,
                        sections: headCategories
                            .map((element) => PieChartSectionData(
                                  radius: 16,
                                  badgeWidget: AnimatedOpacity(
                                      opacity: .2,
                                      duration: Duration(seconds: 1)),
                                  showTitle: false,
                                  value: element.totalPlannedBalance,
                                  color: element.headCategoryColor,
                                ))
                            .toList(),
                      )),
                    ),
                    SizedBox(width: aSpPadding8),
                    Expanded(
                        flex: 2,
                        child: Text.rich(
                          TextSpan(
                              text: appLocalizations.totalPlannedExpenses
                                  .toUpperCase(),
                              style: context.appTextStyles.captionNormal,
                              children: [
                                TextSpan(
                                  text: '\nUS\$ $totalPlannedExpenses',
                                  style: context.appTextStyles.headline2,
                                )
                              ]),
                        ))
                  ],
                ),
              ),
            ] +
            headCategories.asMap().entries.map((element) {
              final name = element.value.localizedNames
                  .getLocalized(appLocalizations.localeName);
              final totalPlannedBalance =
                  'US\$${element.value.totalPlannedBalance}';
              return _BuildHeadCategoryPlannedExpense(
                name: name,
                totalPlannedBalance: totalPlannedBalance,
                headCategoryColor: element.value.headCategoryColor,
                isHeadCategoryViewed:
                    element.key <= currentSetupLayoutInfo.headBudgetIndex!,
              );
            }).toList(),
      ),
    );
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
                width: context.width - aSpPadding32 * 2, child: FlexibleDots()),
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
                        name,
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
                  margin: EdgeInsets.symmetric(horizontal: aSpPadding4),
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
