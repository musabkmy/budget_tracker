import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/helper/shared.dart';
import 'package:budget_tracker/core/widgets/action_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetBudgetStarted extends StatelessWidget {
  const GetBudgetStarted({super.key});

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
      padding: EdgeInsets.symmetric(horizontal: spPadding24),
      child: Column(
        children: [
          AppFilledCupertinoButton(
              text: appLocalizations.getStarted,
              onPressed: () {
                showCustomCupertinoBottomSheet(context);
              }),
          SizedBox(height: padding12),
          AppSecondaryCupertinoButton(
              text: appLocalizations.skipSetup, onPressed: () {}),
        ],
      ),
    ));
  }

  void showCustomCupertinoBottomSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Custom Bottom Sheet',
                style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
              ),
              Spacer(),
              CupertinoButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
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
          padding: EdgeInsets.symmetric(horizontal: spPadding32),
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
