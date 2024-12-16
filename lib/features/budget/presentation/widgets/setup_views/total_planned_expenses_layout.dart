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
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/shared/build_state.dart';
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
            currentSetupLayoutInfo.headBudgetIndex != null &&
            state.currentSetupLayoutInfo.nexHeadCategoryIndex <
                state.currentSetupLayoutInfo.headBudgetCount) {
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
                      BuildStats(
                        currentSetupLayoutInfo: state.currentSetupLayoutInfo,
                        headCategories: headCategories,
                        totalIncomeAndPlannedExpenses: stateModifiable.budget
                            .getIncomeAndPlannedExpenses(),
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
                  child: AppFilledButton(
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
