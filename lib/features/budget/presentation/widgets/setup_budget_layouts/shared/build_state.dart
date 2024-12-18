import 'package:budget_tracker/features/budget/data/models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/shared/build_stats_layout.dart';
import 'package:flutter/cupertino.dart';

class BuildStats extends StatelessWidget {
  const BuildStats({
    super.key,
    required this.headCategories,
    required this.totalIncomeAndPlannedExpenses,
  });
  final List<BudgetHeadCategory> headCategories;
  final (double, double) totalIncomeAndPlannedExpenses;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BuildStatsLayout(
            headCategories: headCategories,
            totalIncomeAndPlannedExpenses: totalIncomeAndPlannedExpenses));
  }
}
