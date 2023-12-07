import 'dart:developer';

import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/exceptions/get_all_machines_exception.dart';
import 'package:printer_monitoring/business/use_case.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';

final class GetAllMachines extends UseCase<List<Machine>, void> {
  final MachineRepository _machineRepository;

  GetAllMachines(this._machineRepository);

  @override
  Future<DataStatus<List<Machine>>> templateCall(void params) {
    log('Trying to get all machines');
    final List<Machine> machines = _machineRepository.getAllMachines();

    if (machines.isNotEmpty) {
      return Future.value(DataSuccess(machines));
    }

    throw GetAllMachinesException('No machines found');
  }
}
