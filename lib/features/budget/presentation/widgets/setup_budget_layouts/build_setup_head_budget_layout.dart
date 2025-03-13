import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context_extension.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/features/budget/data/models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_info.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/shared/build_bottom_field_description.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/shared/build_setup_title_subtitle.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/build_setup_budget_category_layout.dart';
import 'package:flutter/cupertino.dart';

class BuildSetupEditingHeadBudgetLayout extends StatelessWidget {
  const BuildSetupEditingHeadBudgetLayout(
    Key? key, {
    required this.info,
    required this.headCategory,
    required this.stateStatus,
    required this.categoriesId,
    required this.keyHasFocusNode,
    // required this.addControllerAndFocusNodes,
    required this.getControllerAndFocusNode,
    required this.unfocus,
    required this.currentActionView,
  }) : super(key: key);

  final NewBudgetSetupInfo info;
  final BudgetHeadCategory headCategory;
  final CreateBudgetStatusModifiable stateStatus;
  final List<String> categoriesId;
  final String? keyHasFocusNode;
  // final void Function(String key) addControllerAndFocusNodes;
  final FocusNode? Function(String key) getControllerAndFocusNode;
  final void Function() unfocus;
  final Widget currentActionView;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        key: key,
        height: context.heigh * 0.8,
        child: GestureDetector(
          onTap: unfocus,
          child: Stack(
            children: [
              SizedBox(
                height: context.heigh * 0.7,
                child: Column(
                  children: [
                    //title/subtitle categories
                    Expanded(
                      child: ListView(
                          padding: EdgeInsets.symmetric(
                                  horizontal: aSpPadding12)
                              .copyWith(bottom: aButtonHeight + aSpPadding20),
                          children: _buildCategoryWidgets(
                            stateStatus: stateStatus,
                            headCategoryId: headCategory.id,
                            info: info,
                            headCategoryName: headCategory.localizedNames
                                .getLocalized(Localizations.localeOf(context)
                                    .languageCode),
                          )),
                    ),
                    //additional Description if existed
                    info.additionDescription != null
                        ? BuildBottomFieldDescription(
                            child: Text(info.additionDescription!,
                                style: context.appTextStyles.subTitle),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              //action: numeric keyboard or next head category button
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    final slideAnimation = Tween<Offset>(
                      begin: Offset(0, 1), // Starts below the screen
                      end: Offset(0, 0), // Ends in the center
                    ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves
                          .fastLinearToSlowEaseIn, // Smooth curve for the animation
                    ));

                    final fadeAnimation = Tween<double>(
                      begin: 0.1,
                      end: 1.0,
                    ).animate(
                      CurvedAnimation(
                          parent: animation, curve: Curves.easeInOut),
                    );
                    return keyHasFocusNode == null
                        ? FadeTransition(
                            opacity: fadeAnimation,
                            child: child,
                          )
                        : SlideTransition(
                            position: slideAnimation,
                            child: child,
                          );
                  },
                  child: currentActionView,
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> _buildCategoryWidgets(
      {required CreateBudgetStatusModifiable stateStatus,
      required String headCategoryName,
      required String headCategoryId,
      required NewBudgetSetupInfo info}) {
    return <Widget>[
          //head category title/description
          BuildSetupTitleSubtitle(info: info, title: headCategoryName)
        ] +
        //build its categories
        stateStatus.budget.categories.values
            .where((category) => category.headCategoryId == headCategoryId)
            .map((category) {
          //create a controller and focus node for the category
          // addControllerAndFocusNodes(category.id);
          final FocusNode focusNode = getControllerAndFocusNode(category.id)!;
          return BuildSetupBudgetCategoryLayout(
              budgetCategory: category,
              // textEditingController: controller,
              focusNode: focusNode);
        }).toList();
  }
}
