import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/get_budgets_metadata/get_budgets_metadata_bloc.dart';
import 'package:budget_tracker/features/budget/presentation/widgets/setup_budget_layouts/shared/show_app_bottom_sheet.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:budget_tracker/features/budget/presentation/bloc/create_budget/create_budget_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class StartCreatingBudget extends StatelessWidget {
  const StartCreatingBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildSetupLayout(),
        BuildActions(),
      ],
    );
  }
}

class BuildActions extends StatelessWidget {
  const BuildActions({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: aSpPadding24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppFilledButton(
              text: appLocalizations.getStarted,
              withBottomPadding: false,
              onPressed: () {
                final createBudgetBloc = context.read<CreateBudgetBloc>();
                final getBudgetsMetadataBloc =
                    context.read<GetBudgetsMetadataBloc>();

                createBudgetBloc.add(CreateDefaultBudget());
                showCustomCupertinoBottomSheet(
                    context, createBudgetBloc, getBudgetsMetadataBloc);
              }),
          AppTextButton(text: appLocalizations.skipSetup, onPressed: () {}),
        ],
      ),
    ));
  }
}

class BuildSetupLayout extends StatelessWidget {
  const BuildSetupLayout({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: aSpPadding32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/get_budget_started.png'),
              Text.rich(
                TextSpan(
                  text: '${appLocalizations.setupYourFirstBudget}\n',
                  style: context.appTextStyles.headline,
                  children: [
                    TextSpan(
                      text: appLocalizations.setupYourFirstBudgetMsg,
                      style: context.appTextStyles.subHeadline,
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
