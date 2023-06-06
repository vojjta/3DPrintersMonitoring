part of 'machine_bloc.dart';

@immutable
abstract class MachineState {}

class MachineInitial extends MachineState {}

final MachineEntity machine = MachineEntity('Printer', 'unknown');

class MachineLoaded extends MachineState {
  final MachineEntity machine;

  MachineLoaded(this.machine);
}

class MachineLoadError extends MachineState {}
