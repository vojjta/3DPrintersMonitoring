import 'package:printer_monitoring/application/dto/printer_info.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';

final class PrinterMapper {
  PrinterMapper._();

  static PrinterInfo toPrinterInfo(Machine machine) {
    return PrinterInfo(
      name: machine.name,
      ip: machine.address.ip,
      port: machine.address.port,
    );
  }

  static Machine toMachine(PrinterInfo printerInfo) {
    return Machine.createWithId(
      printerInfo.name,
      printerInfo.ip,
    );
  }
}
