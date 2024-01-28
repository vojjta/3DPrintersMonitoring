import 'package:printer_monitoring/domain/primitives/value_exception.dart';

final class IpAddress {
  final String ip;
  final int port;

  IpAddress._(this.ip, {this.port = 80});

  factory IpAddress.fromString(final String hostAddress, {final int port = 80}) {
    try {
      Uri.parseIPv4Address(hostAddress);
    } on FormatException catch (e) {
      throw ValueException('Invalid IP address: $hostAddress. ${e.message}');
    }

    if (port < 0 && port > 65535) {
      throw ValueException('Invalid port: $port. Port must be between 0 and 65535');
    }

    return IpAddress._(hostAddress, port: port);
  }

  String get http => 'http://$ip:$port';

  @override
  String toString() {
    return '$ip:$port';
  }
}
