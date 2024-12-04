part of 'update_budget_bloc.dart';

sealed class UpdateBudgetState extends Equatable {
  const UpdateBudgetState();

  @override
  List<Object> get props => [];
}

final class UpdateBudgetInitial extends UpdateBudgetState {}
