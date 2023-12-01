/// standby: No print in progress
/// printing: The printer is currently printing
/// paused: A print in progress has been paused
/// error: The print exited with an error. print_stats.message contains a related error message
/// complete: The last print has completed

enum MachineState {
  standby,
  printing,
  paused,
  error,
  complete,
}

extension on String {
  MachineState machineState() {
    switch (this) {
      case 'standby':
        return MachineState.standby;
      case 'printing':
        return MachineState.printing;
      case 'paused':
        return MachineState.paused;
      case 'error':
        return MachineState.error;
      case 'complete':
        return MachineState.complete;
      default:
        throw Exception('Unknown state: $this');
    }
  }
}

class MachineInfoEntity {
  late final MachineState state;
  final double bedTemp;
  final double nozzleTemp;
  final String message;

  MachineInfoEntity(String state, this.bedTemp, this.nozzleTemp, this.message) {
    this.state = state.machineState();
  }
}
