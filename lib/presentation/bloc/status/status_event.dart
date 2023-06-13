part of 'status_bloc.dart';

@immutable
abstract class StatusEvent {}

class StatusRefreshPressed extends StatusEvent {}