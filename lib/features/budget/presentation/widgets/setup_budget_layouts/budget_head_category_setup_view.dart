import 'package:budget_tracker/features/budget/presentation/providers/create_budget_popup_appearance_provider.dart';
import 'package:budget_tracker/core/providers/editing_numeric_field_provider.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:budget_tracker/core/widgets/numeric_keyboard.dart';
import 'package:budget_tracker/features/budget/data/models/budget.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/build_setup_head_budget_layout.dart';
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
        debugPrint('_currentActionView: AppFilledButton');
        _currentActionView = AppFilledButton(
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
        debugPrint('bh category to ModifyBudgetCategoryPlannedBalance blo');
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

          return BuildSetupEditingHeadBudgetLayout(
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
