import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/shared/build_stats_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildPlanPlannedExpensesLayout extends StatelessWidget {
  const BuildPlanPlannedExpensesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBudgetBloc, GetBudgetState>(
      builder: (context, state) {
        final budget = state.budget;
        return budget != null &&
                budget.getIncomeAndPlannedExpenses() != (0.0, 0.0)
            ?
            //actual stats
            Container(
                // height: context.heigh * .4,
                margin: EdgeInsets.all(aSpPadding16),

                padding: EdgeInsets.only(top: aSpPadding32),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  borderRadius: aCardRadius,
                ),
                child: BuildStatsLayout(
                  headCategories: budget.headCategories.values.toList(),
                  totalIncomeAndPlannedExpenses:
                      budget.getIncomeAndPlannedExpenses(),
                  fromViewBudget: true,
                  shrinkWrap: true,
                ),
              )
            : SizedBox();
      },
    );
  }
}
