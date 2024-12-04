import 'package:budget_tracker/features/budget/presentation/widgets/get_budget_started.dart';
import 'package:flutter/cupertino.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: GetBudgetStarted());
  }
}
