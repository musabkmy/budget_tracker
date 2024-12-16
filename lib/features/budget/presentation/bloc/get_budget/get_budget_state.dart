// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_budget_bloc.dart';

enum GetBudgetStateStatus {
  initial,
  loading,
  failed,
  canceled,
  completed,
}

class GetBudgetState extends Equatable {
  final GetBudgetStateStatus status;
  final Budget? budget;
  final String? errorMessage;
  const GetBudgetState({required this.status, this.budget, this.errorMessage});

  @override
  List<Object> get props => [
        status,
        budget != null,
      ];

  GetBudgetState copyWith({
    GetBudgetStateStatus? status,
    Budget? budget,
    String? errorMessage,
  }) {
    return GetBudgetState(
      status: status ?? this.status,
      budget: budget ?? this.budget,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

extension GetBudgetStateExt on GetBudgetState {
  bool get isLoading => status == GetBudgetStateStatus.loading;
  bool get isCompleted => status == GetBudgetStateStatus.completed;
  bool get isCanceled => status == GetBudgetStateStatus.canceled;
}
