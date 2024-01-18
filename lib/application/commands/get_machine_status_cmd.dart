import 'dart:developer';

import 'package:printer_monitoring/application/commands.dart';
import 'package:printer_monitoring/application/exceptions/get_machine_exception.dart';
import 'package:printer_monitoring/domain/primitives/either.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';
import 'package:printer_monitoring/domain/value/machine_info.dart';

final class GetMachineStatusCmd implements AsyncCommand<Either<Exception, MachineInfo>> {
  final MachineRepository _machineRepository;

  GetMachineStatusCmd(this._machineRepository);

  @override
  Future<Either<Exception, MachineInfo>> execute() async {
    log('Trying to get machine status');

    if (!(await _machineRepository.isRepositoryReady())) {
      return Either.error(
        GetMachineException('Repository not ready', repository: _machineRepository),
      );
    }

    final MachineInfo? status = await _machineRepository.getStatusInfo();
    if (status != null) {
      return Either.success(status);
    }
    return Either.error(
      GetMachineException('No status found', repository: _machineRepository),
    );
  }
}
