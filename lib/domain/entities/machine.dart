import 'package:printer_monitoring/domain/primitives/entity.dart';
import 'package:printer_monitoring/domain/values/ip_address.dart';

final class Machine extends Entity {
  final String name;
  final IpAddress address;

  String get httpAddress => address.http;

  Machine._(
    super.id,
    this.name,
    this.address,
  );

  Machine._new(
    this.name,
    this.address,
  ) : super.createNew();

  factory Machine.create(
    int id,
    String name,
    String address, {
    final int port = 80,
  }) {
    return Machine._(
      id,
      name,
      IpAddress.fromString(address, port: port),
    );
  }

  factory Machine.createNew(
    String name,
    String address, {
    int port = 80,
  }) {
    return Machine._new(
      name,
      IpAddress.fromString(address, port: port),
    );
  }

  @override
  String toString() {
    return 'Machine{id: $id, name: $name, $address}';
  }
}
