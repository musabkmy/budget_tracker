import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeadCategoriesSetupInfo {
  final String? title;
  final String description;
  final String? additionDescription;
  final String? nextUp;

  HeadCategoriesSetupInfo(
      {this.title,
      required this.description,
      this.additionDescription,
      this.nextUp});
}

Map<String, HeadCategoriesSetupInfo> headCategoriesSetupInfo(
        AppLocalizations appLocalizations) =>
    {
      "start": HeadCategoriesSetupInfo(
        title: appLocalizations.startTitle,
        description: appLocalizations.startDescription,
      ),
      "income": HeadCategoriesSetupInfo(
        description: appLocalizations.incomeDescription,
        additionDescription: appLocalizations.incomeAdditionDescription,
      ),
      "housing": HeadCategoriesSetupInfo(
        description: appLocalizations.housingDescription,
      ),
      "food": HeadCategoriesSetupInfo(
        description: appLocalizations.foodDescription,
        nextUp: appLocalizations.foodNextUp,
      ),
      "lifestyle": HeadCategoriesSetupInfo(
        description: appLocalizations.lifestyleDescription,
        nextUp: appLocalizations.lifestyleNextUp,
      ),
      "savings": HeadCategoriesSetupInfo(
        description: appLocalizations.savingsDescription,
        nextUp: appLocalizations.savingsNextUp,
      ),
    };
