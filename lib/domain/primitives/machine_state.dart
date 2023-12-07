/// standby: No print in progress
/// printing: The printer is currently printing
/// paused: A print in progress has been paused
/// error: The print exited with an error. print_stats.message contains a related error message
/// complete: The last print has completed
sealed class MachineState {
  final String state;

  MachineState(this.state);

  factory MachineState.fromString(String value) {
    switch (value) {
      case 'standby':
        return Standby._();
      case 'printing':
        return Printing._();
      case 'paused':
        return Paused._();
      case 'error':
        return Error._();
      case 'complete':
        return Complete._();
      default:
        throw Exception('Unknown state: $value');
    }
  }
  @override
  String toString() {
    return 'MachineState: $state';
  }
}

final class Standby extends MachineState {
  Standby._() : super('standby');
}

final class Printing extends MachineState {
  Printing._() : super('printing');
}

final class Paused extends MachineState {
  Paused._() : super('paused');
}

final class Error extends MachineState {
  Error._() : super('error');
}

final class Complete extends MachineState {
  Complete._() : super('complete');
}
