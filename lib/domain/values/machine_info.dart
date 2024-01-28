import 'package:printer_monitoring/domain/primitives/machine_state.dart';

class MachineInfo {
  late final MachineState state;
  final double bedTemp;
  final double nozzleTemp;
  final String message;

  MachineInfo(final String state, this.bedTemp, this.nozzleTemp, this.message) {
    this.state = MachineState.fromString(state);
  }

  @override
  String toString() {
    return 'MachineInfo{state: $state, bedTemp: $bedTemp, nozzleTemp: $nozzleTemp, message: $message}';
  }
}
