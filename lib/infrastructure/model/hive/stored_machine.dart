import 'package:isar/isar.dart';

part 'stored_machine.g.dart';

@collection
class StoredMachine {
  Id id = Isar.autoIncrement;

  String name;
  String address;
  int port;

  StoredMachine(this.name, this.address, this.port);
}
