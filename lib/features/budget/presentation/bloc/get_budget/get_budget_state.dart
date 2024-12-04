part of 'get_budget_bloc.dart';

sealed class GetBudgetState extends Equatable {
  const GetBudgetState();

  @override
  List<Object> get props => [];
}

final class GetBudgetInitial extends GetBudgetState {}
