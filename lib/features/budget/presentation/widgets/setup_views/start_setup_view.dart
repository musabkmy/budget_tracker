import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:budget_tracker/core/widgets/period_picker.dart';
import 'package:budget_tracker/core/widgets/app_text_field.dart';
import 'package:budget_tracker/features/budget/data/models/budget_period.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_status.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/new_budget_setup_info.dart';
import 'package:budget_tracker/features/budget/presentation/providers/create_budget_popup_appearance_provider.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_views/shared/build_setup_title_subtitle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartSetupView extends StatefulWidget {
  const StartSetupView({
    super.key,
  });

  @override
  State<StartSetupView> createState() => _StartSetupViewState();
}

class _StartSetupViewState extends State<StartSetupView> {
  late NewBudgetSetupInfo info;
  late TextEditingController _nameTextEditingController;
  late TextEditingController _budgetPeriodTextEditingController;
  late FixedExtentScrollController _fixedExtentScrollController;
  List<BudgetPeriod> allPeriods = BudgetPeriod.allBudgetPeriods;

  void _changeName(String value) {
    setState(() {
      _nameTextEditingController.text = value;
    });
    debugPrint('Name Controller: ${_nameTextEditingController.text}');
  }

  void _changeBudgetPeriod(int index) {
    setState(() {
      _budgetPeriodTextEditingController.text = allPeriods[index].label;
      _fixedExtentScrollController =
          FixedExtentScrollController(initialItem: index);
    });
    debugPrint(
        'Budget Period Controller: ${_budgetPeriodTextEditingController.text}');
  }

  @override
  void initState() {
    super.initState();
    final currentStatus =
        context.read<CreateBudgetBloc>().state.createBudgetStatus;
    if (currentStatus is CreateBudgetStatusModifiable) {
      final budget = currentStatus.budget;
      _nameTextEditingController = TextEditingController(text: budget.name);
      _budgetPeriodTextEditingController =
          TextEditingController(text: budget.budgetPeriod.label);
      _fixedExtentScrollController = FixedExtentScrollController(
          initialItem:
              allPeriods.indexWhere((item) => item == budget.budgetPeriod));
    } else {
      _nameTextEditingController = TextEditingController();
      _budgetPeriodTextEditingController = TextEditingController();
      _fixedExtentScrollController = FixedExtentScrollController();
    }
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _budgetPeriodTextEditingController.dispose();
    _fixedExtentScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BlocSelector<CreateBudgetBloc, CreateBudgetState,
        Map<String, NewBudgetSetupInfo>>(
      selector: (state) => state.getNewBudgetSetupInfo(appLocalizations),
      builder: (context, setupInfo) {
        info = setupInfo.getItem('start');
        return SizedBox(
          height: context.heigh * 0.8,
          child: Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(horizontal: aSpPadding24)
                    .copyWith(bottom: aButtonHeight + aSpPadding20),
                children: [
                  BuildSetupTitleSubtitle(info: info, withTopPadding: false),
                  AppTextfield(
                      title: appLocalizations.nameLabel,
                      controller: _nameTextEditingController,
                      valueChanged: (value) => _changeName(value)),
                  SizedBox(height: aSpPadding12),
                  BudgetPeriodPicker(
                    title: appLocalizations.budget,
                    periods: allPeriods,
                    textEditingController: _budgetPeriodTextEditingController,
                    fixedExtentScrollController: _fixedExtentScrollController,
                    onSelectedItemChanged: (index) =>
                        _changeBudgetPeriod(index),
                  ),
                ],
              ),
              _ContinueButton(
                  nameTextEditingController: _nameTextEditingController,
                  allPeriods: allPeriods,
                  budgetPeriodTextEditingController:
                      _budgetPeriodTextEditingController),
            ],
          ),
        );
      },
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({
    required TextEditingController nameTextEditingController,
    required this.allPeriods,
    required TextEditingController budgetPeriodTextEditingController,
  })  : _nameTextEditingController = nameTextEditingController,
        _budgetPeriodTextEditingController = budgetPeriodTextEditingController;

  final TextEditingController _nameTextEditingController;
  final List<BudgetPeriod> allPeriods;
  final TextEditingController _budgetPeriodTextEditingController;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Align(
      alignment: Alignment.bottomCenter,
      child: AppFilledButton(
          text: appLocalizations.continueLabel,
          onPressed: () {
            context.read<CreateBudgetPopupAppearanceProvider>().toNextLayout =
                true;
            context.read<CreateBudgetBloc>().add(
                  ChangeBudgetNameAndPeriod(
                      name: _nameTextEditingController.text,
                      budgetPeriod: allPeriods.firstWhere(
                          (item) =>
                              item.label ==
                              _budgetPeriodTextEditingController.text,
                          orElse: () => allPeriods.first)),
                );
            // debugPrint('res is $res');
          }),
    );
  }
}
