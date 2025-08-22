import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'budget_tracker'**
  String get appTitle;

  /// No description provided for @databaseException.
  ///
  /// In en, this message translates to:
  /// **'Internal Error'**
  String get databaseException;

  /// No description provided for @insertFailureException.
  ///
  /// In en, this message translates to:
  /// **'Failed to insert {item}.'**
  String insertFailureException(String item);

  /// No description provided for @itemNotFoundException.
  ///
  /// In en, this message translates to:
  /// **'Could not find this {item}.'**
  String itemNotFoundException(String item);

  /// No description provided for @badRequest.
  ///
  /// In en, this message translates to:
  /// **'Bad request.'**
  String get badRequest;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred.'**
  String get unknownError;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @setupYourFirstBudget.
  ///
  /// In en, this message translates to:
  /// **'Setup your first budget 💰'**
  String get setupYourFirstBudget;

  /// No description provided for @setupYourFirstBudgetMsg.
  ///
  /// In en, this message translates to:
  /// **'We\'ll guide you through the steps of setting up your personalised household budget'**
  String get setupYourFirstBudgetMsg;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// No description provided for @skipSetup.
  ///
  /// In en, this message translates to:
  /// **'Skip setup'**
  String get skipSetup;

  /// No description provided for @startTitle.
  ///
  /// In en, this message translates to:
  /// **'Start with the basics'**
  String get startTitle;

  /// No description provided for @startDescription.
  ///
  /// In en, this message translates to:
  /// **'We recommend using the same budget period as your regular income.'**
  String get startDescription;

  /// No description provided for @incomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Your regular income will be the amount you have to budget for. feel free to make an estimation as you can update this later.'**
  String get incomeDescription;

  /// No description provided for @incomeAdditionDescription.
  ///
  /// In en, this message translates to:
  /// **'If you want to budget using only expenses, then go ahead and skip this step.'**
  String get incomeAdditionDescription;

  /// No description provided for @housingDescription.
  ///
  /// In en, this message translates to:
  /// **'These expenses should be fairly regular from period to period.'**
  String get housingDescription;

  /// No description provided for @foodDescription.
  ///
  /// In en, this message translates to:
  /// **'Your food costs can fluctuate a lot - a fair estimation is good enough here.'**
  String get foodDescription;

  /// No description provided for @foodNextUp.
  ///
  /// In en, this message translates to:
  /// **'Food and consumable are usually our highest variable expenses, it\'s also the area where we can improve the most.'**
  String get foodNextUp;

  /// No description provided for @lifestyleDescription.
  ///
  /// In en, this message translates to:
  /// **'Finish up budgeting your expenses with your lifestyle spendings.'**
  String get lifestyleDescription;

  /// No description provided for @lifestyleNextUp.
  ///
  /// In en, this message translates to:
  /// **'From entertainment to healthcare, we all need it, and should plan for it as well.'**
  String get lifestyleNextUp;

  /// No description provided for @savingsDescription.
  ///
  /// In en, this message translates to:
  /// **'How much would you like to put away in savings each period?'**
  String get savingsDescription;

  /// No description provided for @savingsNextUp.
  ///
  /// In en, this message translates to:
  /// **'We recommend that you save roughly 10% of your salary.'**
  String get savingsNextUp;

  /// No description provided for @finishTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re all set up!'**
  String get finishTitle;

  /// No description provided for @finishDescription.
  ///
  /// In en, this message translates to:
  /// **'Great job! Remember, you can edit anything you\'re just entered and add a new categories after on.'**
  String get finishDescription;

  /// No description provided for @totalPlannedExpenses.
  ///
  /// In en, this message translates to:
  /// **'Total planned expenses'**
  String get totalPlannedExpenses;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @okLabel.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get okLabel;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @budgetPeriodLabel.
  ///
  /// In en, this message translates to:
  /// **'Budget period'**
  String get budgetPeriodLabel;

  /// No description provided for @amountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountLabel;

  /// No description provided for @nextUpHeadCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Next up - {headCategory}'**
  String nextUpHeadCategoryLabel(String headCategory);

  /// No description provided for @planLabel.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get planLabel;

  /// No description provided for @remainingLabel.
  ///
  /// In en, this message translates to:
  /// **'remaining'**
  String get remainingLabel;

  /// No description provided for @insightsLabel.
  ///
  /// In en, this message translates to:
  /// **'insights'**
  String get insightsLabel;

  /// No description provided for @leftOfIncomeLabel.
  ///
  /// In en, this message translates to:
  /// **'left of income'**
  String get leftOfIncomeLabel;

  /// No description provided for @plannedExpensesLabel.
  ///
  /// In en, this message translates to:
  /// **'Planned Expenses'**
  String get plannedExpensesLabel;

  /// No description provided for @overIncomeLabel.
  ///
  /// In en, this message translates to:
  /// **'over income'**
  String get overIncomeLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
