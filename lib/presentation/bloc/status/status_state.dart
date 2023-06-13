part of 'status_bloc.dart';

@immutable
abstract class StatusState {}

class StatusInitial extends StatusState {}

class StatusLoaded extends StatusState {
  final MachineInfoEntity status;

  StatusLoaded(this.status);
}

class StatusLoadError extends StatusState {}
