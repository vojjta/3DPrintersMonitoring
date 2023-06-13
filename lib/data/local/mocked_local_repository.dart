import 'package:printer_monitoring/business/entities/machine.dart';
import 'package:printer_monitoring/business/repository/machine_repository.dart';

class MockedLocalRepository implements MachineRepository {
  MachineEntity? _machineEntity = MachineEntity('RedHood', '192.168.100.240');

  @override
  bool addMachine(MachineEntity machine) {
    _machineEntity = machine;
    return true;
  }

  @override
  List<MachineEntity> getAllMachines() {
    if (_machineEntity != null) {
      return [_machineEntity!];
    }
    return [];
  }

  @override
  MachineEntity? getMachine(String address) {
    return _machineEntity;
  }

  @override
  bool removeMachine(MachineEntity machine) {
    _machineEntity = null;
    return true;
  }

  @override
  bool updateMachine(MachineEntity machine) {
    _machineEntity = machine;
    return true;
  }

}
