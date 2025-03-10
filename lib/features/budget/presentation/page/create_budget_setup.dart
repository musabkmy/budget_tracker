import 'package:budget_tracker/config/dependency_injection/di.dart';
import 'package:budget_tracker/config/theme/app_icons.dart';
import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/providers/editing_numeric_field_provider.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/presentation/providers/create_budget_popup_appearance_provider.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_layouts_info.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/budget_head_category_setup_view.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/finish_setup_view.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/start_setup_view.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/total_planned_expenses_layout.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/shared/build_expenses_to_income_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CreateBudgetSetup extends StatelessWidget {
  const CreateBudgetSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final appearanceProvider =
        Provider.of<CreateBudgetPopupAppearanceProvider>(context);
    return ChangeNotifierProvider<EditingNumericFieldProvider>(
      create: (_) => di<EditingNumericFieldProvider>(),
      child: Container(
        height: context.heigh * 0.9,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(aSpPadding12)),
          color: appearanceProvider.popupBackgroundColor,
        ),
        child: BuildSetupLayout(),
      ),
    );
  }
}

class BuildSetupLayout extends StatefulWidget {
  const BuildSetupLayout({
    super.key,
  });

  @override
  State<BuildSetupLayout> createState() => _BuildSetupLayoutState();
}

class _BuildSetupLayoutState extends State<BuildSetupLayout> {
  // List<Widget> setUpLayoutSteps = [

  // ];
  late Widget _currentView;

  @override
  void initState() {
    _currentView = CupertinoActivityIndicator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateBudgetBloc, CreateBudgetState>(
        listener: (context, state) {
          debugPrint('got change in BuildSetupLayout');
          return _handlePageChange(state);
        },
        child: Column(
          children: [
            _BuildTopNav(),
            _BuildView(currentView: _currentView),
          ],
        ));
  }

  void _handlePageChange(CreateBudgetState state) {
    final layoutType = state.currentSetupLayoutInfo.layoutType;
    switch (layoutType) {
      case LayoutType.headCategory:
        final headCategoryName =
            state.currentSetupLayoutInfo.nextHeadBudgetName;
        final headCategoryIndex = state.currentSetupLayoutInfo.headBudgetIndex;
        debugPrint('headCategoryName: $headCategoryName');
        if (headCategoryName != '') {
          setState(() {
            debugPrint('_currentView to $headCategoryName');
            _currentView = BudgetHeadCategorySetupView(Key(headCategoryName),
                headCategoryName: headCategoryName,
                headCategoryIndex: headCategoryIndex!);
          });
        }
        break;

      case LayoutType.stats:
        setState(() {
          _currentView = TotalPlannedExpensesLayout();
        });
        break;

      case LayoutType.start:
        setState(() {
          _currentView = StartSetupView();
        });
        break;

      case LayoutType.finish:
        setState(() {
          _currentView = FinishSetupView();
        });
        break;
    }
  }
}

class _BuildView extends StatelessWidget {
  const _BuildView({
    required Widget currentView,
  }) : _currentView = currentView;

  final Widget _currentView;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut, // Smooth curve for the animation
          );

          return FadeTransition(
            opacity: curvedAnimation,
            child: child,
          );
        },
        child: _currentView);
  }
}

class _BuildTopNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appearanceProvider =
        Provider.of<CreateBudgetPopupAppearanceProvider>(context);
    //get the layout type, total income and total planned expenses
    return BlocSelector<CreateBudgetBloc, CreateBudgetState,
        (BudgetSetupLayoutsInfo, (double?, double?))>(
      selector: (state) {
        final stateModifiable = state.createBudgetStatus;
        return (
          state.currentSetupLayoutInfo,
          (stateModifiable is CreateBudgetStatusModifiable)
              ? (stateModifiable.budget.getIncomeAndPlannedExpenses())
              : (null, null)
        );
      },
      builder: (context, data) {
        final layoutType = data.$1.layoutType;
        final totalPlannedIncome = data.$2.$1 ?? 0;
        final totalPlannedExpenses = data.$2.$2 ?? 0;
        return SizedBox(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            layoutType == LayoutType.start
                ? SizedBox()
                :
                //back pressed
                CupertinoButton(
                    onPressed: appearanceProvider.popupHasFocus
                        ? () {}
                        : () {
                            appearanceProvider.toNextLayout = false;
                            context
                                .read<CreateBudgetBloc>()
                                .add(ToPreviousSetupLayout());
                          },
                    child: Icon(AppIcons.backIcon,
                        size: iconSize,
                        color: appearanceProvider.popupHasFocus
                            ? CupertinoTheme.of(context).neutralShadeColor
                            : CupertinoTheme.of(context).primaryColor),
                  ),
            (layoutType == LayoutType.headCategory ||
                        layoutType == LayoutType.stats) &&
                    totalPlannedIncome != 0 &&
                    totalPlannedExpenses != 0
                ? BuildExpensesToIncomeLayout(
                    totalPlannedIncome: totalPlannedIncome,
                    totalPlannedExpenses: totalPlannedExpenses)
                : SizedBox(),
            CupertinoButton(
              onPressed: appearanceProvider.popupHasFocus ? () {} : () {},
              child: Icon(AppIcons.closeIcon,
                  size: iconSize,
                  color: appearanceProvider.popupHasFocus
                      ? CupertinoTheme.of(context).neutralShadeColor
                      : CupertinoTheme.of(context).primaryColor),
            ),
          ],
        ));
      },
    );
  }
}
