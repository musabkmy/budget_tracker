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
        final items = state.budget!.headCategories.keys.toList();
        return state.isCompleted
            ? ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.zero,
                primary: false,
                physics: ClampingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) =>
                    BuildPlanHeadCategory(budgetHeadCategoryKey: items[index])
                        .fadeOutIn(
                  key: items[index],
                  // durationInMilSec: 50,
                  // scrollController: scrollController,
                ),
                // children: state.budget!.headCategories.keys
                //     .map((elementKey) => BuildPlanHeadCategory(
                //         budgetHeadCategoryKey: elementKey))
                //     .toList(),
              )
            // .scrollAdapterAnimation(scrollController: scrollController)
            : SizedBox();
      },
    );
  }
}
