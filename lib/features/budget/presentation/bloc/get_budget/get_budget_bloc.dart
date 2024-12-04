import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_budget_event.dart';
part 'get_budget_state.dart';

class GetBudgetBloc extends Bloc<GetBudgetEvent, GetBudgetState> {
  GetBudgetBloc() : super(GetBudgetInitial()) {
    on<GetBudgetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
