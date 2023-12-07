import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';

class MockedLocalRepository implements MachineRepository {
  Machine? _machineEntity = Machine.create('RedHood', '192.168.100.244');

  @override
  bool addMachine(Machine machine) {
    _machineEntity = machine;
    return true;
  }

  @override
  List<Machine> getAllMachines() {
    if (_machineEntity != null) {
      return [_machineEntity!];
    }
    return [];
  }

  @override
  Machine? getMachine(String address) {
    return _machineEntity;
  }

  @override
  bool removeMachine(Machine machine) {
    _machineEntity = null;
    return true;
  }

  @override
  bool updateMachine(Machine machine) {
    _machineEntity = machine;
    return true;
  }
}
