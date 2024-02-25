import 'package:printer_monitoring/application/bloc/status/status_bloc.dart';
import 'package:printer_monitoring/domain/values/machine_info.dart';

final class PrinterInfoMapper {
  final MachineInfo info;

  PrinterInfoMapper(this.info);

  StatusLoadSuccess toStatusLoaded() => StatusLoadSuccess(
        bedTemp: info.bedTemp,
        nozzleTemp: info.nozzleTemp,
      );
}
