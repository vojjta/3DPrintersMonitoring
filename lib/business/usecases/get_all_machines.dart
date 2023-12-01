import 'dart:developer';

import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/use_case.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repository/machine_repository.dart';

class GetAllMachines extends UseCase<List<MachineEntity>, void> {
  final MachineRepository _machineRepository;

  GetAllMachines(this._machineRepository);

  @override
  Future<DataStatus<List<MachineEntity>>> templateCall(void params) {
    log('Trying to get all machines');
    final List<MachineEntity> machines = _machineRepository.getAllMachines();

    if (machines.isNotEmpty) {
      return Future.value(DataSuccess(machines));
    }

    throw Exception('No machines found');
  }
}
