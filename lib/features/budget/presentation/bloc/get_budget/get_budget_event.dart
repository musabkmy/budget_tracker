part of 'get_budget_bloc.dart';

sealed class GetBudgetEvent extends Equatable {
  const GetBudgetEvent();

  @override
  List<Object> get props => [];
}

//get default
class GetBudgetData extends GetBudgetEvent {
  final String key;

  const GetBudgetData({required this.key});
}
