import 'package:budget_tracker/config/theme/shared_values.dart';
import 'package:budget_tracker/core/extensions/build_context.dart';
import 'package:budget_tracker/core/utils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class BuildExpensesToIncomeLayout extends StatelessWidget {
  const BuildExpensesToIncomeLayout({
    super.key,
    required this.totalPlannedIncome,
    required this.totalPlannedExpenses,
  });

  final double totalPlannedIncome;
  final double totalPlannedExpenses;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SizedBox(
      width: context.width * .6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
                text:
                    'US\$ ${(totalPlannedIncome - totalPlannedExpenses).abs().priceFormat}  ',
                style: context.appTextStyles.bodyBold,
                children: [
                  TextSpan(
                    text: totalPlannedExpenses <= totalPlannedIncome
                        ? appLocalizations.leftOfIncomeLabel
                        : totalPlannedIncome == 0
                            ? appLocalizations.plannedExpensesLabel
                            : appLocalizations.overIncomeLabel,
                    style: context.appTextStyles.bodyNormal,
                  ),
                ]),
          ),
          SizedBox(height: aSpPadding4),
          _AppProgressLine(
              progress: totalPlannedIncome == 0 ||
                      totalPlannedIncome <= totalPlannedExpenses
                  ? 1
                  : (totalPlannedExpenses) / (totalPlannedIncome)),
        ],
      ),
    );
  }
}

class _AppProgressLine extends StatelessWidget {
  final double progress; // Value from 0.0 to 1.0

  const _AppProgressLine({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * .5, // Full-width progress bar
      height: 2, // Height of the progress line
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context)
            .scaffoldBackgroundColor, // Progress line color
        // Background color
        borderRadius: BorderRadius.circular(2),
      ),

      child: FractionallySizedBox(
        widthFactor: progress, // Progress indicator width
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color:
                CupertinoTheme.of(context).primaryColor, // Progress line color
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
