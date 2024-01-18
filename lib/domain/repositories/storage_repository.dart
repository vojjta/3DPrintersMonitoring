import 'package:printer_monitoring/domain/entities/machine.dart';

abstract interface class StorageRepository {
  Future<void> addMachine(Machine machine);

  Future<List<Machine>> getAllMachines();

  bool removeMachine(int id);
}
