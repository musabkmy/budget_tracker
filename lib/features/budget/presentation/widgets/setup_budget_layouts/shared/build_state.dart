import 'package:budget_tracker/features/budget/data/models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_layouts_info.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/shared/build_stats_layout.dart';
import 'package:flutter/cupertino.dart';

class BuildStats extends StatelessWidget {
  const BuildStats({
    super.key,
    this.currentSetupLayoutInfo,
    required this.headCategories,
    required this.totalIncomeAndPlannedExpenses,
  });
  final BudgetSetupLayoutsInfo? currentSetupLayoutInfo;
  final List<BudgetHeadCategory> headCategories;
  final (double, double) totalIncomeAndPlannedExpenses;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BuildStatsLayout(
      headCategories: headCategories,
      totalIncomeAndPlannedExpenses: totalIncomeAndPlannedExpenses,
      currentSetupLayoutInfo: currentSetupLayoutInfo,
    ));
  }
}
