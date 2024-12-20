import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc() : super(InitLoading()) {
    on<InitEvent>((event, emit) {
      on<LoadAppData>(_loadAppData);
    });
  }
  @Deprecated('use []')
  Future<void> _loadAppData(LoadAppData event, Emitter<InitState> emit) async {}
}
