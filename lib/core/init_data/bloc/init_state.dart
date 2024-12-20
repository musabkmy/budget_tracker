part of 'init_bloc.dart';

@immutable
sealed class InitState {}

final class InitLoading extends InitState {}

final class InitError extends InitState {
  final Map<String, String> localizedErrorMessage;
  InitError(this.localizedErrorMessage);
}

final class InitLoaded extends InitState {
  // final InitData initData;
  // InitLoaded(this.initData);
}
