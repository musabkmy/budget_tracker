import 'package:budget_tracker/config/dependency_injection/di_ex.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_info.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/shared/build_setup_title_subtitle.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/shared/build_state.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/total_planned_expenses_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FinishSetupView extends StatelessWidget {
  const FinishSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SizedBox(
      height: context.heigh * .8,
      child: BlocBuilder<CreateBudgetBloc, CreateBudgetState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          final stateModifiable = state.createBudgetStatus;
          if (stateModifiable is CreateBudgetStatusModifiable) {
            final headCategories =
                stateModifiable.budget.headCategories.values.toList();
            final finishInfo =
                state.getNewBudgetSetupInfo(appLocalizations)['finish']!;
            return Stack(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      BuildSetupTitleSubtitle(
                        info: finishInfo,
                        withTopPadding: false,
                      ),
                      SizedBox(
                        height: context.heigh * .7,
                        child: Column(
                          children: [
                            //actual stats
                            BuildStats(
                              currentSetupLayoutInfo:
                                  state.currentSetupLayoutInfo,
                              headCategories: headCategories,
                              totalIncomeAndPlannedExpenses: stateModifiable
                                  .budget
                                  .getIncomeAndPlannedExpenses(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //to next head category btn
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AppFilledCupertinoButton(
                      text: appLocalizations.continueLabel,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
