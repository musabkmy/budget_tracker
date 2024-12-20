import 'package:budget_tracker/config/dependency_injection/di.dart';
import 'package:budget_tracker/core/providers/editing_numeric_field_provider.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budgets_metadata/get_budgets_metadata_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/page/view_budget.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/start_creating_budget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBudgetPage extends StatefulWidget {
  const MainBudgetPage({super.key});

  @override
  State<MainBudgetPage> createState() => _MainBudgetPageState();
}

class _MainBudgetPageState extends State<MainBudgetPage> {
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
        // return StartCreatingBudget();
        return state.isLoading
            ? CupertinoActivityIndicator()
            : state.isCompletedWithNoBudgets
                ? StartCreatingBudget()
                : state.isCompletedWithBudgets && state.hasViewedBudgetKey
                    ? ViewBudget(budgetKey: state.viewedBudgetKey!)
                    : state.isFailed
                        ? Placeholder()
                        : Placeholder();
      },
    );
  }
}
