import 'package:printer_monitoring/business/entities/machine.dart';

abstract class MachineRepository {
  bool addMachine(MachineEntity machine);

  MachineEntity? getMachine(String address);

  List<MachineEntity> getAllMachines();

  bool removeMachine(MachineEntity machine);

  bool updateMachine(MachineEntity machine);
}
