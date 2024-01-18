import 'dart:developer';

import 'package:printer_monitoring/application/data_status.dart';
import 'package:printer_monitoring/application/exceptions/get_machine_exception.dart';
import 'package:printer_monitoring/application/use_case.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';
import 'package:printer_monitoring/domain/value/machine_info.dart';

final class GetMachineStatus extends UseCase<MachineInfo, void> {
  final MachineRepository _machineRepository;

  GetMachineStatus(this._machineRepository);

  @override
  Future<DataStatus<MachineInfo>> templateCall(void params) async {
    log('Trying to get machine status');
    if (!(await _machineRepository.isRepositoryReady())) {
      throw GetMachineException('Repository not ready', repository: _machineRepository);
    }

    final MachineInfo? status = await _machineRepository.getStatusInfo();
    if (status != null) {
      return DataSuccess(status);
    }
    throw GetMachineException('No status found', repository: _machineRepository);
  }
}
