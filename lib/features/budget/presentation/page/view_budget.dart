import 'package:budget_tracker/config/dependency_injection/di.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/providers/editing_numeric_field_provider.dart';
import 'package:budget_tracker/core/providers/focus_nodes_manager_provider.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/view_budget_layouts/plan_layouts/build_plan_budget_period_layout.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/view_budget_layouts/plan_layouts/build_plan_head_categories_layout.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/view_budget_layouts/plan_layouts/build_plan_planned_expenses_layout.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/view_budget_layouts/build_view_budget_top_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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

  final ScrollController _planHeadCategoriesScrollController =
      ScrollController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    _planHeadCategoriesScrollController
        .dispose(); // Always dispose to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EditingNumericFieldProvider>(
            create: (_) => di<EditingNumericFieldProvider>()),
        ChangeNotifierProvider<FocusNodesManagerProvider>(
            create: (_) => di<FocusNodesManagerProvider>()),
      ],
      child: context.watch<GetBudgetBloc>().state.isCompleted
          ? CupertinoPageScaffold(
              child: CustomScrollView(
              controller: _scrollController,
              // physics: ClampingScrollPhysics(),
              slivers: [
                BuildViewBudgetTopNav(),
                SliverPadding(
                  padding: EdgeInsets.all(aSpPadding16),
                  sliver: SliverToBoxAdapter(
                    child: BuildPlanBudgetPeriodLayout(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: BuildPlanPlannedExpensesLayout(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: aSpPadding16),
                  sliver: SliverToBoxAdapter(
                    child: BuildPlanHeadCategoriesLayout(
                        _planHeadCategoriesScrollController),
                  ),
                )
              ],
            ))
          : SizedBox(),
    );
  }
}
