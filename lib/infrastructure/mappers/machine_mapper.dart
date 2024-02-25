import 'package:flutter/cupertino.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/infrastructure/model/hive/stored_machine.dart';

@immutable
final class MachineMapper {
  final Machine _machine;

  const MachineMapper(this._machine);

  StoredMachine toStoredMachine() {
    return StoredMachine(
      _machine.name,
      _machine.address.ip,
      _machine.address.port,
    );
  }
}
