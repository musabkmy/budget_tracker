import 'package:budget_tracker/config/dependency_injection/di_ex.dart';
import 'package:budget_tracker/core/extensions/build_context_extension.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/shared/build_setup_title_subtitle.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/shared/build_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget_tracker/config/localization/app_localizations.dart';

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
                SizedBox(
                  height: context.heigh * .8,
                  child: Column(
                    // padding: EdgeInsets.zero,
                    children: [
                      BuildSetupTitleSubtitle(
                        info: finishInfo,
                        withTopPadding: false,
                      ),
                      //actual stats
                      BuildStats(
                        headCategories: headCategories,
                        totalIncomeAndPlannedExpenses: stateModifiable.budget
                            .getIncomeAndPlannedExpenses(),
                      ),
                    ],
                  ),
                ),
                //to next head category btn
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AppFilledButton(
                      text: appLocalizations.okLabel,
                      onPressed: () {
                        context
                            .read<CreateBudgetBloc>()
                            .add(FinishModifyingBudget());
                        Navigator.pop(context, stateModifiable.budget.id);
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
