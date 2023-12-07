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
    String name,
    String address,
  ) {
    return Machine._(
      const Uuid().v1(),
      name,
      IpAddress(address),
    );
  }
}
