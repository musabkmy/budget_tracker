// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_budget_bloc.dart';

// enum CreateBudgetStatus { initial, loading, success, failure }

class CreateBudgetState extends Equatable {
  final CreateBudgetStatus createBudgetStatus;

  const CreateBudgetState({
    required this.createBudgetStatus,
  });

  CreateBudgetState copyWith({
    CreateBudgetStatus? newCreateBudgetStatus,
  }) {
    return CreateBudgetState(
      createBudgetStatus: newCreateBudgetStatus ?? createBudgetStatus,
    );
  }

  @override
  List<Object?> get props => [
        createBudgetStatus,
      ];
}
