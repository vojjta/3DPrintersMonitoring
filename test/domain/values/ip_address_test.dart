import 'package:flutter_test/flutter_test.dart';
import 'package:printer_monitoring/domain/primitives/value_exception.dart';
import 'package:printer_monitoring/domain/values/ip_address.dart';

void main() {
  group('Testing valid inputs', () {
    test('Testing IP 192.168.100.1 port 80', () {
      final IpAddress result = IpAddress.fromString('192.168.100.1', port: 80);

      expect(result.ip, '192.168.100.1');
      expect(result.port, 80);
      expect(result.http, 'http://192.168.100.1:80');
    });
  });

  group('Testing invalid inputs', () {
    test('Testing host name as input', () {
      expect(
        () => IpAddress.fromString('example.com'),
        throwsA(isException),
        reason: 'It should take an numeric form of IP address as input',
      );
    });

    test('Testing address out of range', () {
      expect(
        () => IpAddress.fromString('192.168.100.256'),
        throwsA(isException),
        reason: 'Invalid IP address: 192.168.100.256. Invalid value for octet 4',
      );
    });

    test('Testing port out of range', () {
      expect(
        () => IpAddress.fromString('192.168.100.1', port: 65536),
        throwsA(const TypeMatcher<ValueException>()),
        reason: 'Port must be between 0 and 65535',
      );
      expect(
        () => IpAddress.fromString('192.168.100.1', port: -1),
        throwsA(const TypeMatcher<ValueException>()),
        reason: 'Port must be between 0 and 65535',
      );
    });
  });
}
