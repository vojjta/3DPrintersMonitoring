final class PrinterInfo {
  final String name;
  final String ip;
  final int port;

  String get httpAddress => 'http://$ip:$port';

  PrinterInfo({required this.name, required this.ip, required this.port});

  factory PrinterInfo.fromBasic({
    required final String name,
    required final String ip,
    required final int port,
  }) {
    return PrinterInfo(
      name: name,
      ip: ip,
      port: port,
    );
  }
}
