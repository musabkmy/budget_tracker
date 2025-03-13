import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context_extension.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/data/models/budget_period.dart';
import 'package:budget_tracker/features/budget/data/models/budget_period_type.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildPlanBudgetPeriodLayout extends StatelessWidget {
  const BuildPlanBudgetPeriodLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GetBudgetBloc, GetBudgetState, Budget?>(
      selector: (state) {
        return state.budget;
      },
      builder: (context, budget) {
        return budget != null
            ? Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: aSpPadding20),
                decoration: BoxDecoration(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  borderRadius: aButtonBorderRadius,
                ),
                child: Text(
                  _getText(AppLocalizations.of(context)?.localeName,
                      period: budget.budgetPeriod, startDate: budget.startDate),
                  style: context.appTextStyles.largeBody,
                ),
              )
            : SizedBox();
      },
    );
  }

  String _getText(String? localeName,
      {required BudgetPeriod period, required DateTime startDate}) {
    switch (period.budgetPeriodType) {
      case BudgetPeriodType.week:
        return startDate.getDateStartFinish(
            localeName, BudgetPeriod.week.periodInDays);
      case BudgetPeriodType.biWeek:
        return startDate.getDateStartFinish(
            localeName, BudgetPeriod.week.periodInDays);
      case BudgetPeriodType.month:
        return startDate.getMonth(localeName);

      case BudgetPeriodType.biMonth:
        return startDate.getBiMonth(localeName);

      case BudgetPeriodType.year:
        return startDate.getYear(localeName);
    }
  }
}
