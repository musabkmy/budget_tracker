import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/view_budget_layouts/build_budget_period_layout.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/view_budget_layouts/build_planned_expenses_layout.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/view_budget_layouts/build_view_budget_top_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewBudget extends StatefulWidget {
  const ViewBudget({super.key, required this.budgetKey});
  final String budgetKey;

  @override
  State<ViewBudget> createState() => _ViewBudgetState();
}

class _ViewBudgetState extends State<ViewBudget> {
  @override
  void initState() {
    super.initState();
    context.read<GetBudgetBloc>().add(GetBudgetData(key: widget.budgetKey));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBudgetBloc, GetBudgetState>(
      builder: (context, state) {
        // debugPrint('${toString()}: ${state.status}, ${state.budget}');

        if (state.isCompleted) {
          return CupertinoPageScaffold(
              child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              BuildViewBudgetTopNav(),
              SliverPadding(
                padding: EdgeInsets.all(aSpPadding16),
                sliver: SliverToBoxAdapter(
                  child: BuildBudgetPeriodLayout(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(aSpPadding16),
                sliver: SliverToBoxAdapter(
                  child: BuildPlannedExpensesLayout(),
                ),
              )
            ],
          ));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
