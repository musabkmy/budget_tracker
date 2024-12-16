import 'package:budget_tracker/features/budget/presentation/bloc/get_budgets_metadata/get_budgets_metadata_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/page/view_budget.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/get_budget_started.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  late Widget layoutToBuild;
  @override
  void initState() {
    super.initState();
    context.read<GetBudgetsMetadataBloc>().add(GetBudgetsMetaData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBudgetsMetadataBloc, GetBudgetsMetadataState>(
      builder: (context, state) {
        return state.isLoading
            ? CupertinoActivityIndicator()
            : state.isCompletedWithNoBudgets
                ? GetBudgetStarted()
                : state.isCompletedWithBudgets
                    ? ViewBudget(budgetMetadata: state.allBudgetsMetadata.first)
                    : state.isFailed
                        ? Text('failed')
                        : Text('Something went wrong!');
      },
    );
  }
}
