import 'package:flutter/cupertino.dart';
import 'package:printer_monitoring/domain/values/machine_info.dart';
import 'package:printer_monitoring/infrastructure/model/json/printer_status_result.dart';

@immutable
final class PrinterStatusMapper {
  final PrinterStatusResult _result;

  const PrinterStatusMapper(this._result);

  MachineInfo toMachineInfo() {
    return MachineInfo(
      _result.status.printStats.state,
      _result.status.heaterBed.temperature,
      _result.status.extruder.temperature,
      _result.status.printStats.message,
    );
  }
}
