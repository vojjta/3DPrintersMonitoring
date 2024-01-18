import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

class MockedLocalRepository implements StorageRepository {
  Machine? _machineEntity; //= Machine.create('RedHood', '192.168.100.244');

  @override
  Future<void> addMachine(Machine machine) {
    _machineEntity = machine;
    return Future<void>.value();
  }

  @override
  Future<List<Machine>> getAllMachines() async {
    if (_machineEntity != null) {
      return [_machineEntity!];
    }
    return [];
  }

  @override
  bool removeMachine(int id) {
    _machineEntity = null;
    return true;
  }
}
