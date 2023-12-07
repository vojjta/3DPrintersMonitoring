part of 'machine_bloc.dart';

@immutable
abstract class MachineState {}

class InitialNoMachine extends MachineState {}

class MachineLoaded extends MachineState {
  final Machine machine;

  MachineLoaded(this.machine);
}

class MachineLoadError extends MachineState {}
