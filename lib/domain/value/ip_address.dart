// TODO(Vojjta): Add validation
class IpAddress {
  final String ip;
  final int port;

  IpAddress(this.ip, {this.port = 80});

  String get http => 'http://$ip:$port';

  @override
  String toString() {
    return '$ip:$port';
  }
}
