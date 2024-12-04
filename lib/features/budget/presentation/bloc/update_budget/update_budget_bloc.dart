import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_budget_event.dart';
part 'update_budget_state.dart';

class UpdateBudgetBloc extends Bloc<UpdateBudgetEvent, UpdateBudgetState> {
  UpdateBudgetBloc() : super(UpdateBudgetInitial()) {
    on<UpdateBudgetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
