import 'dart:developer';

import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/use_case.dart';
import 'package:printer_monitoring/domain/entities/machine_info.dart';
import 'package:printer_monitoring/domain/repository/status_repository.dart';

class GetMachineStatus extends UseCase<MachineInfoEntity, void> {
  final StatusRepository _statusRepository;

  GetMachineStatus(this._statusRepository);

  @override
  Future<DataStatus<MachineInfoEntity>> templateCall(void params) async {
    log('Trying to get machine status');
    if (!(await _statusRepository.isRepositoryReady())) {
      throw Exception('Repository not ready');
    }

    final MachineInfoEntity? status = await _statusRepository.getStatusInfo();
    if (status != null) {
      return DataSuccess(status);
    }
    throw Exception('No status found');
  }
}
