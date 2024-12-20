// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_budget_bloc.dart';

enum GetBudgetStateStatus {
  initial,
  loading,
  failed,
  canceled,
  completed,
}

enum BudgetViewLayoutType { plan, remaining, insights }

class GetBudgetState extends Equatable {
  const GetBudgetState({
    required this.status,
    this.currentLayout = BudgetViewLayoutType.plan,
    this.errorMessage,
    this.budget,
  });
  final GetBudgetStateStatus status;
  final BudgetViewLayoutType currentLayout;
  final String? errorMessage;
  final Budget? budget;

  @override
  List<Object?> get props => [
        status,
        currentLayout,
        errorMessage,
        budget,
      ];

  GetBudgetState copyWith({
    GetBudgetStateStatus? status,
    BudgetViewLayoutType? currentLayout,
    Budget? budget,
    String? errorMessage,
  }) {
    return GetBudgetState(
      status: status ?? this.status,
      currentLayout: currentLayout ?? this.currentLayout,
      budget: budget ?? this.budget,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

extension GetBudgetStateExt on GetBudgetState {
  bool get isLoading => status == GetBudgetStateStatus.loading;
  bool get isCompleted => status == GetBudgetStateStatus.completed;
  bool get isCanceled => status == GetBudgetStateStatus.canceled;

  bool get atPlan => currentLayout == BudgetViewLayoutType.plan;
  bool get atRemaining => currentLayout == BudgetViewLayoutType.remaining;
  bool get atInsights => currentLayout == BudgetViewLayoutType.insights;
}
