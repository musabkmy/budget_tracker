import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/features/budget/presentation/providers/create_budget_popup_appearance_provider.dart';
import 'package:budget_tracker/core/providers/editing_numeric_field_provider.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:budget_tracker/core/widgets/numeric_keyboard.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/data/models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_info.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/shared/build_bottom_field_description.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/build_budget_category_setup_layout.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/shared/build_setup_title_subtitle.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class BudgetHeadCategorySetupView extends StatefulWidget {
  final String headCategoryName;
  final int headCategoryIndex;
  const BudgetHeadCategorySetupView(Key key,
      {required this.headCategoryName, required this.headCategoryIndex})
      : super(key: key);

  @override
  State<BudgetHeadCategorySetupView> createState() =>
      _BudgetHeadCategorySetupViewState();
}

class _BudgetHeadCategorySetupViewState
    extends State<BudgetHeadCategorySetupView> {
  String? _headCategoryId;
  final Map<String, FocusNode> _focusNodes = {};
  String? _keyHasFocusNode;
  Widget _currentActionView = SizedBox();
  @override
  void initState() {
    super.initState();
    debugPrint('in init state of _BudgetHeadCategorySetupViewState');
    _addControllerAndFocusNode();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      debugPrint('at init: setInitCurrentActionView');
      setInitCurrentActionView();
    });
  }

  void setInitCurrentActionView() {
    final stateStatus =
        context.read<CreateBudgetBloc>().state.createBudgetStatus;

    if (stateStatus is CreateBudgetStatusModifiable) {
      setState(() {
        debugPrint('_currentActionView: AppFilledCupertinoButton');
        _currentActionView = AppFilledCupertinoButton(
            text: AppLocalizations.of(context)!.continueLabel,
            onPressed: () {
              context.read<CreateBudgetPopupAppearanceProvider>().toNextLayout =
                  true;
              context.read<CreateBudgetBloc>().add(NextBudgetHeadCategory(
                  categories: [],
                  headCategoryId:
                      stateStatus.budget.headCategories[_headCategoryId]!.id));
            });
      });
    }
  }

  void _addControllerAndFocusNode() {
    final stateStatus =
        context.read<CreateBudgetBloc>().state.createBudgetStatus;

    if (stateStatus is CreateBudgetStatusModifiable) {
      final headCategory = stateStatus.budget.headCategories.values
          .elementAt(widget.headCategoryIndex);
      _headCategoryId = headCategory.id;
      final categoriesId = stateStatus.budget.getCategoriesId(headCategory.id);
      for (var categoryId in categoriesId) {
        setState(() {
          debugPrint('added $categoryId');

          _focusNodes[categoryId] = FocusNode();
          _focusNodes[categoryId]!.addListener(() {
            if (_focusNodes[categoryId]!.hasFocus &&
                _keyHasFocusNode != categoryId) {
              setState(() {
                _keyHasFocusNode = categoryId;
                debugPrint('_currentActionView: NumericKeyboard');
                _currentActionView = NumericKeyboard(
                  label: AppLocalizations.of(context)!.amountLabel,
                  // onKeyPressed: (value) => addDigit(value),
                  onDonePressed: _unfocus,
                  // onRemovePressed: removeDigit,
                );
              });
              //change background color of popup
              context
                  .read<CreateBudgetPopupAppearanceProvider>()
                  .togglePopupBackgroundColor(true, categoryId);
              debugPrint('_keyHasFocusNode: $_keyHasFocusNode');
            }
          });
        });
      }
    }
  }

  FocusNode? _getFocusNode(String key) {
    if (_focusNodes.containsKey(key)) {
      debugPrint('budget hc view: got $key');
      return _focusNodes[key]!;
    }
    return null;
  }

  void _unfocus() {
    if (_keyHasFocusNode != null && _focusNodes.containsKey(_keyHasFocusNode)) {
      debugPrint('inside budget hc view: on unfocus');

      _focusNodes[_keyHasFocusNode]!.unfocus();

      //save changes if there is change may be occurred
      if (context.read<EditingNumericFieldProvider>().isInit) {
        context.read<CreateBudgetBloc>().add(ModifyBudgetCategoryPlannedBalance(
            headCategoryId: _headCategoryId!,
            categoryId: _keyHasFocusNode!,
            newPlannedBalance: double.parse(
                context.read<EditingNumericFieldProvider>().value!)));
      }
      //change popup background to default
      context
          .read<CreateBudgetPopupAppearanceProvider>()
          .togglePopupBackgroundColor(false, null);
      //clear focus node key
      setState(() {
        debugPrint('_keyHasFocusNode: null');
        _keyHasFocusNode = null;
      });

      debugPrint('_currentActionView:  setInitCurrentActionView');
      setInitCurrentActionView();

      //clear editing field provider data
      context.read<EditingNumericFieldProvider>().clear();
    }
  }

  ///dedicated to the additional categories that has been added
  void _removeFocusNode(String key) {
    setState(() {
      _focusNodes[key]?.dispose();
      _focusNodes.remove(key);
    });
  }

  @override
  void dispose() {
    debugPrint('at budget hc view: dispose');
    for (var focusNodes in _focusNodes.values) {
      focusNodes.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return BlocBuilder<CreateBudgetBloc, CreateBudgetState>(
      builder: (context, state) {
        final stateStatus = state.createBudgetStatus;

        if (stateStatus is CreateBudgetStatusModifiable) {
          final info = state
              .getNewBudgetSetupInfo(appLocalizations)
              .getItem(widget.headCategoryName);
          final headCategory =
              stateStatus.budget.headCategories[_headCategoryId]!;
          final categoriesId =
              stateStatus.budget.getCategoriesId(headCategory.id);

          return BudgetHeadCategorySetupViewLayout(
            ValueKey(widget.headCategoryName),
            info: info,
            headCategory: headCategory,
            stateStatus: stateStatus,
            categoriesId: categoriesId,
            keyHasFocusNode: _keyHasFocusNode,
            // addControllerAndFocusNodes: _addControllerAndFocusNode,
            getControllerAndFocusNode: _getFocusNode,
            unfocus: _unfocus,
            currentActionView: _currentActionView,
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class BudgetHeadCategorySetupViewLayout extends StatelessWidget {
  const BudgetHeadCategorySetupViewLayout(
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
          return BuildBudgetCategorySetupLayout(
              budgetCategory: category,
              // textEditingController: controller,
              focusNode: focusNode);
        }).toList();
  }
}
