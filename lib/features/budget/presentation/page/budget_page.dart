import 'package:budget_tracker/features/budget/presentation/widgets/get_budget_started.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,

        //to disable resizing when enabling keyboard
        resizeToAvoidBottomInset: false,
        child: GetBudgetStarted());
  }
}
