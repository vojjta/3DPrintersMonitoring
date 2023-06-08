enum MachineState {
  idle,
  printing,
  error,
}

class MachineInfoEntity {
  final MachineState state;
  final double bedTemp;
  final double nozzleTemp;

  MachineInfoEntity(this.state, this.bedTemp, this.nozzleTemp);
}
