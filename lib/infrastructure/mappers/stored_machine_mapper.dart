import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/infrastructure/model/hive/stored_machine.dart';

final class StoredMachineMapper {
  StoredMachineMapper._();

  static StoredMachine fromMachine(final Machine machine) {
    return StoredMachine(
      machine.name,
      machine.address.ip,
      machine.address.port,
    );
  }

  static Machine toMachine(final StoredMachine storedMachine) {
    return Machine.create(
      storedMachine.id,
      storedMachine.name,
      storedMachine.address,
      port: storedMachine.port,
    );
  }
}
