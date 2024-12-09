import 'package:budget_tracker/config/theme/app_icons.dart';
import 'package:budget_tracker/config/theme/app_theme.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/providers/appearance_provider.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_layouts_info.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/budget_head_category_setup_view.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/build_budget_category_setup_layout.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/start_setup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CreateBudgetSetup extends StatelessWidget {
  const CreateBudgetSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final appearanceProvider = Provider.of<AppearanceProvider>(context);
    return Container(
      height: context.heigh * 0.9,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(aSpPadding12)),
        color: appearanceProvider.popupBackgroundColor,
      ),
      child: BuildSetupLayout(),
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
            _currentView,
          ],
        ));
  }

  void _handlePageChange(CreateBudgetState state) {
    if (state.createBudgetStatus is CreateBudgetStatusModifiable) {
      final layoutType = state.currentSetupLayoutInfo.layoutType;
      switch (layoutType) {
        case LayoutType.headCategory:
          final headCategoryName =
              state.currentSetupLayoutInfo.nextHeadBudgetName;
          final headCategoryIndex =
              state.currentSetupLayoutInfo.headBudgetIndex;
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
          final headCategoryName =
              state.currentSetupLayoutInfo.nextHeadBudgetName;
          final headCategoryIndex =
              state.currentSetupLayoutInfo.headBudgetIndex;
          if (headCategoryName != '') {
            setState(() {
              // _currentView = SetupStatView(headCategoryName);
            });
          }
          break;

        case LayoutType.start:
          setState(() {
            _currentView = StartSetupView();
          });
          break;

        case LayoutType.finish:
          setState(() {
            _currentView = StartSetupView();
          });
          break;

        default:
          setState(() {
            _currentView = const SizedBox();
          });
      }
    } else {
      _currentView = const SizedBox();
    }
  }
}

class _BuildTopNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appearanceProvider = Provider.of<AppearanceProvider>(context);
    return BlocSelector<CreateBudgetBloc, CreateBudgetState,
        BudgetSetupLayoutsInfo>(
      selector: (state) => state.currentSetupLayoutInfo,
      builder: (context, infos) {
        return SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              infos.layoutType == LayoutType.start
                  ? SizedBox()
                  : CupertinoButton(
                      onPressed: appearanceProvider.popupHasFocus
                          ? () {}
                          : () {
                              context
                                  .read<CreateBudgetBloc>()
                                  .add(ToPreviousSetupLayout());
                            },
                      child: Icon(AppIcons.backIcon,
                          size: iconSize,
                          color: appearanceProvider.popupHasFocus
                              ? CupertinoTheme.of(context).helper1Color
                              : CupertinoTheme.of(context).primaryColor),
                    ),
              CupertinoButton(
                onPressed: appearanceProvider.popupHasFocus ? () {} : () {},
                child: Icon(AppIcons.closeIcon,
                    size: iconSize,
                    color: appearanceProvider.popupHasFocus
                        ? CupertinoTheme.of(context).helper1Color
                        : CupertinoTheme.of(context).primaryColor),
              )
            ],
          ),
        );
      },
    );
  }
}
