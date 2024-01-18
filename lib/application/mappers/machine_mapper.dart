import 'package:printer_monitoring/application/bloc/status/status_bloc.dart';
import 'package:printer_monitoring/domain/value/machine_info.dart';

final class MachineMapper {
  MachineMapper._();

  static StatusLoaded toStatusLoaded(MachineInfo info) => StatusLoaded(
        bedTemp: info.bedTemp,
        nozzleTemp: info.nozzleTemp,
      );
}
