import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/providers/appearance_provider.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:budget_tracker/core/widgets/numeric_keyboard.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget.dart';
import 'package:budget_tracker/features/budget/data/models/budget_models/budget_head_categories.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_info.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/build_budget_category_setup_layout.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/build_setup_title_subtitle.dart';
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
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, FocusNode> _focusNodes = {};
  String? _keyHasFocusNode;

  @override
  void initState() {
    super.initState();
    debugPrint('in init state of _BudgetHeadCategorySetupViewState');
    _addControllerAndFocusNode();
  }

  void _addControllerAndFocusNode() {
    final stateStatus =
        context.read<CreateBudgetBloc>().state.createBudgetStatus;

    if (stateStatus is CreateBudgetStatusModifiable) {
      final headCategory = stateStatus.budget.headCategories.values
          .elementAt(widget.headCategoryIndex);
      final categoriesId = stateStatus.budget.getCategoriesId(headCategory.id);
      for (var categoryId in categoriesId) {
        setState(() {
          debugPrint('added $categoryId');
          _controllers[categoryId] = TextEditingController(
            text: stateStatus.budget
                .getCategoryPlannedBalance(categoryId)
                .toInt()
                .toString(),
          )..addListener(() {
              if (_controllers[categoryId]!.text.isEmpty) {
                _controllers[categoryId]!.text = '0';

                // to avoid calling listener again
                _controllers[categoryId]!.selection = TextSelection.collapsed(
                  offset: _controllers[categoryId]!.text.length,
                );
              }
            });
          _focusNodes[categoryId] = FocusNode();
          _focusNodes[categoryId]!.addListener(() {
            if (_focusNodes[categoryId]!.hasFocus) {
              setState(() {
                _keyHasFocusNode = categoryId;
              });

              //change background color of popup
              context
                  .read<AppearanceProvider>()
                  .togglePopupBackgroundColor(true, categoryId);
              debugPrint('_keyHasFocusNode: $_keyHasFocusNode');
            }
          });
        });
      }
    }
  }

  (TextEditingController? controller, FocusNode? focusNode)
      _getControllerAndFocusNode(String key) {
    if (_controllers.containsKey(key) && _focusNodes.containsKey(key)) {
      debugPrint('got $key');
      return (_controllers[key]!, _focusNodes[key]!);
    }
    return (null, null);
  }

  void _addDigit(String value) {
    if (_keyHasFocusNode != null &&
        _controllers.containsKey(_keyHasFocusNode)) {
      final controllerValue = _controllers[_keyHasFocusNode]!.text;
      controllerValue == '0'
          ? setState(() {
              _controllers[_keyHasFocusNode]!.text = value;
            })
          : controllerValue.length >= plannedBalanceFieldLengthLimit
              ? setState(() {
                  _controllers[_keyHasFocusNode]!.text = controllerValue
                      .substring(0, plannedBalanceFieldLengthLimit);
                })
              : setState(() {
                  _controllers[_keyHasFocusNode]!.text =
                      controllerValue + value;
                });
      debugPrint('_addDigit $value');
    }
  }

  void _removeDigit() {
    if (_keyHasFocusNode != null &&
        _controllers.containsKey(_keyHasFocusNode)) {
      final controllerValue = _controllers[_keyHasFocusNode]!.text;
      if (controllerValue.isNotEmpty && controllerValue != '0') {
        debugPrint('at remove digit and is not empty');
        setState(() {
          _controllers[_keyHasFocusNode]!.text =
              controllerValue.substring(0, controllerValue.length - 1);
          // deprecated: used listener instead
          // if (_controllers[_keyHasFocusNode]!.text.isEmpty) {
          //   _controllers[_keyHasFocusNode]!.text = '0';
          // }
        });
      }
    }
  }

  void _unfocus() {
    if (_keyHasFocusNode != null &&
        _focusNodes.containsKey(_keyHasFocusNode) &&
        _controllers.containsKey(_keyHasFocusNode)) {
      _focusNodes[_keyHasFocusNode]!.unfocus();
      //TODO: change value of subcategory _controllers[_keyHasFocusNode]!;
      setState(() {
        _keyHasFocusNode = null;
      });
      context
          .read<AppearanceProvider>()
          .togglePopupBackgroundColor(false, null);
    }
  }

  void _removeControllerAndFocusNode(String key) {
    setState(() {
      _controllers[key]?.dispose();
      _controllers.remove(key);
      _focusNodes[key]?.dispose();
      _focusNodes.remove(key);
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
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
          final headCategory = stateStatus.budget.headCategories.values
              .elementAt(widget.headCategoryIndex);
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
            getControllerAndFocusNode: _getControllerAndFocusNode,
            addDigit: _addDigit,
            unfocus: _unfocus,
            removeDigit: _removeDigit,
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
    required this.addDigit,
    required this.unfocus,
    required this.removeDigit,
  }) : super(key: key);

  final NewBudgetSetupInfo info;
  final BudgetHeadCategory headCategory;
  final CreateBudgetStatusModifiable stateStatus;
  final List<String> categoriesId;
  final String? keyHasFocusNode;
  // final void Function(String key) addControllerAndFocusNodes;
  final (TextEditingController?, FocusNode?) Function(String key)
      getControllerAndFocusNode;
  final void Function(String value) addDigit;
  final void Function() unfocus;
  final void Function() removeDigit;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SizedBox(
        key: key,
        height: context.heigh * 0.8,
        child: GestureDetector(
          onTap: unfocus,
          child: Stack(
            children: [
              ListView(
                  padding: EdgeInsets.symmetric(horizontal: aSpPadding12)
                      .copyWith(bottom: aButtonHeight + aSpPadding20),
                  children: _buildCategoryWidgets(
                    stateStatus: stateStatus,
                    headCategoryId: headCategory.id,
                    info: info,
                    headCategoryName: headCategory.localizedNames.getLocalized(
                        Localizations.localeOf(context).languageCode),
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: keyHasFocusNode != null
                    ? NumericKeyboard(
                        label: appLocalizations.amountLabel,
                        onKeyPressed: (value) => addDigit(value),
                        onDonePressed: unfocus,
                        onRemovePressed: removeDigit,
                      )
                    : AppFilledCupertinoButton(
                        text: appLocalizations.continueLabel,
                        onPressed: () {
                          context.read<CreateBudgetBloc>().add(
                              AddBudgetCategories(
                                  categories: [],
                                  headCategoryId: headCategory.id));
                        }),
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
          BuildSetupTitleSubtitle(info: info, title: headCategoryName)
        ] +
        stateStatus.budget.categories.values
            .where((category) => category.headCategoryId == headCategoryId)
            .map((category) {
          //create a controller and focus node for the category
          // addControllerAndFocusNodes(category.id);
          final TextEditingController controller;
          final FocusNode focusNode;
          (controller!, focusNode!) = getControllerAndFocusNode(category.id);
          return BuildBudgetCategorySetupLayout(
              budgetCategory: category,
              textEditingController: controller,
              focusNode: focusNode);
        }).toList();
  }
}
