import 'package:printer_monitoring/domain/entities/machine.dart';

abstract interface class MachineRepository {
  bool addMachine(Machine machine);

  Machine? getMachine(String address);

  List<Machine> getAllMachines();

  bool removeMachine(Machine machine);

  bool updateMachine(Machine machine);
}
