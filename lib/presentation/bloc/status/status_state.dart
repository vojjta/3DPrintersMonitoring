part of 'status_bloc.dart';

@immutable
abstract class StatusState {}

class StatusInitial extends StatusState {}

class StatusLoaded extends StatusState {
  final MachineInfo status;

  StatusLoaded(this.status);
}

class StatusLoadError extends StatusState {}
