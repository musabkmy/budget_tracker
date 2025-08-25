// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'budget_tracker';

  @override
  String get databaseException => 'Internal Error';

  @override
  String insertFailureException(String item) {
    return 'Failed to insert $item.';
  }

  @override
  String itemNotFoundException(String item) {
    return 'Could not find this $item.';
  }

  @override
  String get badRequest => 'Bad request.';

  @override
  String get unknownError => 'An unknown error occurred.';

  @override
  String get overview => 'Overview';

  @override
  String get budget => 'Budget';

  @override
  String get wallet => 'Wallet';

  @override
  String get setupYourFirstBudget => 'Setup your first budget 💰';

  @override
  String get setupYourFirstBudgetMsg =>
      'We\'ll guide you through the steps of setting up your personalised household budget';

  @override
  String get getStarted => 'Get started';

  @override
  String get skipSetup => 'Skip setup';

  @override
  String get startTitle => 'Start with the basics';

  @override
  String get startDescription =>
      'We recommend using the same budget period as your regular income.';

  @override
  String get incomeDescription =>
      'Your regular income will be the amount you have to budget for. feel free to make an estimation as you can update this later.';

  @override
  String get incomeAdditionDescription =>
      'If you want to budget using only expenses, then go ahead and skip this step.';

  @override
  String get housingDescription =>
      'These expenses should be fairly regular from period to period.';

  @override
  String get foodDescription =>
      'Your food costs can fluctuate a lot - a fair estimation is good enough here.';

  @override
  String get foodNextUp =>
      'Food and consumable are usually our highest variable expenses, it\'s also the area where we can improve the most.';

  @override
  String get lifestyleDescription =>
      'Finish up budgeting your expenses with your lifestyle spendings.';

  @override
  String get lifestyleNextUp =>
      'From entertainment to healthcare, we all need it, and should plan for it as well.';

  @override
  String get savingsDescription =>
      'How much would you like to put away in savings each period?';

  @override
  String get savingsNextUp =>
      'We recommend that you save roughly 10% of your salary.';

  @override
  String get finishTitle => 'You\'re all set up!';

  @override
  String get finishDescription =>
      'Great job! Remember, you can edit anything you\'re just entered and add a new categories after on.';

  @override
  String get totalPlannedExpenses => 'Total planned expenses';

  @override
  String get continueLabel => 'Continue';

  @override
  String get okLabel => 'Ok';

  @override
  String get nameLabel => 'Name';

  @override
  String get budgetPeriodLabel => 'Budget period';

  @override
  String get amountLabel => 'Amount';

  @override
  String nextUpHeadCategoryLabel(String headCategory) {
    return 'Next up - $headCategory';
  }

  @override
  String get planLabel => 'Plan';

  @override
  String get remainingLabel => 'remaining';

  @override
  String get insightsLabel => 'insights';

  @override
  String get leftOfIncomeLabel => 'left of income';

  @override
  String get plannedExpensesLabel => 'Planned Expenses';

  @override
  String get overIncomeLabel => 'over income';
}
