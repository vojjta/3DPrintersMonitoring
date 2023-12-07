import 'dart:developer';

import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/exceptions/get_machine_exception.dart';
import 'package:printer_monitoring/business/use_case.dart';
import 'package:printer_monitoring/domain/repositories/status_repository.dart';
import 'package:printer_monitoring/domain/value/machine_info.dart';

final class GetMachineStatus extends UseCase<MachineInfo, void> {
  final StatusRepository _statusRepository;

  GetMachineStatus(this._statusRepository);

  @override
  Future<DataStatus<MachineInfo>> templateCall(void params) async {
    log('Trying to get machine status');
    if (!(await _statusRepository.isRepositoryReady())) {
      throw GetMachineException('Repository not ready', repository: _statusRepository);
    }

    final MachineInfo? status = await _statusRepository.getStatusInfo();
    if (status != null) {
      return DataSuccess(status);
    }
    throw GetMachineException('No status found', repository: _statusRepository);
  }
}
