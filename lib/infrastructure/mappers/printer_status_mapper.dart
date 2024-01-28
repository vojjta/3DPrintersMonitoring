import 'package:printer_monitoring/domain/values/machine_info.dart';
import 'package:printer_monitoring/infrastructure/model/json/printer_status_result.dart';

final class PrinterStatusMapper {
  PrinterStatusMapper._();

  static MachineInfo toMachineInfo(PrinterStatusResult result) {
    return MachineInfo(
      result.status.printStats.state,
      result.status.heaterBed.temperature,
      result.status.extruder.temperature,
      result.status.printStats.message,
    );
  }
}
