import 'package:budget_tracker/core/animation/animation_service.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/view_budget_layouts/plan_layouts/build_plan_head_category_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildPlanHeadCategoriesLayout extends StatelessWidget {
  const BuildPlanHeadCategoriesLayout(this.scrollController, {super.key});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBudgetBloc, GetBudgetState>(
      builder: (context, state) {
        // final items = state.budget!.headCategories.keys.toList();
        return state.isCompleted
            ? Column(
                children: state.budget!.headCategories.keys
                    .map((elementKey) =>
                        BuildPlanHeadCategory(budgetHeadCategoryKey: elementKey)
                            .fadeOutIn(key: elementKey))
                    .toList(),
              )
            // .scrollAdapterAnimation(scrollController: scrollController)
            : SizedBox();
      },
    );
  }
}
