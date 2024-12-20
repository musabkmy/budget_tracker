import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/view_budget_layouts/plan_layouts/build_plan_head_category_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildPlanHeadCategoriesLayout extends StatelessWidget {
  const BuildPlanHeadCategoriesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBudgetBloc, GetBudgetState>(
      builder: (context, state) {
        return state.isCompleted
            ? Column(
                children: state.budget!.headCategories.keys
                    .map((elementKey) => BuildPlanHeadCategory(
                        budgetHeadCategoryKey: elementKey))
                    .toList(),
              )
            : SizedBox();
      },
    );
  }
}
