part of 'init_bloc.dart';

@immutable
sealed class InitEvent {}

class LoadAppData extends InitEvent {}
