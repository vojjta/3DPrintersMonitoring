// TODO(Vojjta): Add validation
class IpAddress {
  final String host;
  final int port;

  IpAddress(this.host, {this.port = 80});

  @override
  String toString() {
    return '$host:$port';
  }
}
