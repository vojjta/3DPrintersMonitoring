import 'package:printer_monitoring/domain/primitives/machine_state.dart';

class MachineInfo {
  late final MachineState state;
  final double bedTemp;
  final double nozzleTemp;
  final String message;

  MachineInfo(String state, this.bedTemp, this.nozzleTemp, this.message) {
    this.state = MachineState.fromString(state);
  }
}
