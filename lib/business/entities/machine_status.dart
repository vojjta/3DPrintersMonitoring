enum MachineState {
  idle,
  printing,
  error,
}

class MachineStatusEntity {
  final MachineState state;
  final double bedTemp;
  final double nozzleTemp;

  MachineStatusEntity(this.state, this.bedTemp, this.nozzleTemp);
}
