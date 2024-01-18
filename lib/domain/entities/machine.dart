import 'package:printer_monitoring/domain/entity.dart';
import 'package:printer_monitoring/domain/value/ip_address.dart';
import 'package:uuid/uuid.dart';

final class Machine extends Entity {
  final String name;
  final IpAddress address;

  Machine._(
    super.id,
    this.name,
    this.address,
  );

  factory Machine.create(
    int id,
    String name,
    String address, {
    final int port = 80,
  }) {
    return Machine._(
      id,
      name,
      IpAddress(address, port: port),
    );
  }
  // for development purpose
  factory Machine.createWithId(
    String name,
    String address,
  ) {
    return Machine._(
      fastHash(const Uuid().v4()),
      name,
      IpAddress(address),
    );
  }

  // https://isar.dev/recipes/string_ids.html#fast-hash-function
  static int fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }

  @override
  String toString() {
    return 'Machine{id: $id, name: $name, $address}';
  }
}
