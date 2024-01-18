import 'package:isar/isar.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';

part 'stored_machine.g.dart';

@collection
class StoredMachine {
  Id id = Isar.autoIncrement;

  String name;
  String address;
  int port;

  StoredMachine(this.name, this.address, this.port);

  factory StoredMachine.fromMachine(Machine machine) {
    return StoredMachine(
      machine.name,
      machine.address.ip,
      machine.address.port,
    );
  }

  Machine toMachine() {
    return Machine.create(
      id,
      name,
      address,
      port: port,
    );
  }
}
