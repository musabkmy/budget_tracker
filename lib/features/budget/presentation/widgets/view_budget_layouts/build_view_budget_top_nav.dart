import 'package:budget_tracker/config/theme/app_icons.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:budget_tracker/core/widgets/app_sliver_navigation.dart';
import 'package:budget_tracker/core/widgets/app_sliver_tab.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budget/get_budget_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budgets_metadata/get_budgets_metadata_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class BuildViewBudgetTopNav extends StatelessWidget {
  const BuildViewBudgetTopNav({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<GetBudgetBloc, GetBudgetState>(
      builder: (context, state) {
        final budget = state.budget;
        return budget != null
            ? AppSliverNavigationBar(
                topWidgets: [
                  _BuildBudgetSettingsButton(),
                  _BuildSelectedBudgetButton(budgetName: budget.name),
                  _BuildEditBudgetCategoriesLayout(),
                ],
                bottomWidgets: [
                  AppSliverTab(
                      onPressed: () => context.read<GetBudgetBloc>().add(
                          ChangeBudgetViewCurrentLayout(
                              layout: BudgetViewLayoutType.plan)),
                      isPressed: state.atPlan,
                      title: appLocalizations.planLabel),
                  AppSliverTab(
                      onPressed: () => context.read<GetBudgetBloc>().add(
                          ChangeBudgetViewCurrentLayout(
                              layout: BudgetViewLayoutType.remaining)),
                      isPressed: state.atRemaining,
                      title: appLocalizations.remainingLabel),
                  AppSliverTab(
                      onPressed: () => context.read<GetBudgetBloc>().add(
                          ChangeBudgetViewCurrentLayout(
                              layout: BudgetViewLayoutType.insights)),
                      isPressed: state.atInsights,
                      title: appLocalizations.insightsLabel),
                ],
              )
            : SizedBox();
      },
    );
  }
}

class _BuildEditBudgetCategoriesLayout extends StatelessWidget {
  const _BuildEditBudgetCategoriesLayout();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .2,
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Icon(AppIcons.editIcon, size: aPadding28)),
    );
  }
}

class _BuildSelectedBudgetButton extends StatelessWidget {
  const _BuildSelectedBudgetButton({
    required this.budgetName,
  });

  final String budgetName;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SizedBox(
      width: context.width * .6,
      child: AppTextButton(
        onPressed: () {
          context.read<GetBudgetsMetadataBloc>().add(
              ChangeViewedBudgetKey('f86b5347-af1f-4508-9624-66bdf1b100b3'));
          // showCustomCupertinoBottomSheet(context,
          //     child: Container(
          //         height: context.heigh * .8,
          //         color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          //         child: StartCreatingBudget()));
        },
        withoutPadding: true,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: '${appLocalizations.budget}: ',
              style: context.appTextStyles.bodyNormal,
              children: [
                TextSpan(
                  text: '$budgetName ',
                  style: context.appTextStyles.fieldText,
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(AppIcons.downArrowIcon, size: aSpPadding14),
                ),
              ]),
        ),
      ),
    );
  }
}

class _BuildBudgetSettingsButton extends StatelessWidget {
  const _BuildBudgetSettingsButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .2,
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Icon(AppIcons.settingsIcon, size: aPadding28)),
    );
  }
}
