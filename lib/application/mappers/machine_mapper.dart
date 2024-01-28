import 'package:printer_monitoring/application/bloc/printer/printer_state.dart';
import 'package:printer_monitoring/application/bloc/status/status_bloc.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/values/machine_info.dart';

final class MachineMapper {
  MachineMapper._();

  static StatusLoaded toStatusLoaded(MachineInfo info) => StatusLoaded(
        bedTemp: info.bedTemp,
        nozzleTemp: info.nozzleTemp,
      );

  static PrinterLoaded toPrinterLoaded(Machine machine) {
    return PrinterLoaded(
      name: machine.name,
    );
  }
}
