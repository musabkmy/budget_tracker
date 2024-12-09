// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_budget_bloc.dart';

// enum CreateBudgetStatus { initial, loading, success, failure }

class CreateBudgetState extends Equatable {
  final CreateBudgetStatus createBudgetStatus;
  //contains data used to about creating an new budget
  Map<String, NewBudgetSetupInfo> getNewBudgetSetupInfo(
          AppLocalizations appLocalizations) =>
      {
        "start": NewBudgetSetupInfo(
          title: appLocalizations.startTitle,
          description: appLocalizations.startDescription,
        ),
        "income": NewBudgetSetupInfo(
          description: appLocalizations.incomeDescription,
          additionDescription: appLocalizations.incomeAdditionDescription,
        ),
        "housing": NewBudgetSetupInfo(
          description: appLocalizations.housingDescription,
        ),
        "food": NewBudgetSetupInfo(
          description: appLocalizations.foodDescription,
          nextUp: appLocalizations.foodNextUp,
        ),
        "lifestyle": NewBudgetSetupInfo(
          description: appLocalizations.lifestyleDescription,
          nextUp: appLocalizations.lifestyleNextUp,
        ),
        "savings": NewBudgetSetupInfo(
          description: appLocalizations.savingsDescription,
          nextUp: appLocalizations.savingsNextUp,
        ),
      };
  //contains infos about current step
  final BudgetSetupLayoutsInfo currentSetupLayoutInfo;
  const CreateBudgetState({
    required this.createBudgetStatus,
    required this.currentSetupLayoutInfo,
  });

  CreateBudgetState copyWith({
    CreateBudgetStatus? newCreateBudgetStatus,
    BudgetSetupLayoutsInfo? currentSetupLayoutInfo,
  }) {
    return CreateBudgetState(
      createBudgetStatus: newCreateBudgetStatus ?? createBudgetStatus,
      currentSetupLayoutInfo:
          currentSetupLayoutInfo ?? this.currentSetupLayoutInfo,
    );
  }

  @override
  List<Object?> get props => [
        createBudgetStatus,
        currentSetupLayoutInfo,
      ];
}
