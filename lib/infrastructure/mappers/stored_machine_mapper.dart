import 'package:meta/meta.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/infrastructure/model/hive/stored_machine.dart';

@immutable
final class StoredMachineMapper {
  final StoredMachine _storedMachine;

  const StoredMachineMapper(this._storedMachine);

  Machine toMachine() {
    return Machine.create(
      _storedMachine.id,
      _storedMachine.name,
      _storedMachine.address,
      port: _storedMachine.port,
    );
  }
}
