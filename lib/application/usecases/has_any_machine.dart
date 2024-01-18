import 'dart:developer';

import 'package:printer_monitoring/application/data_status.dart';
import 'package:printer_monitoring/application/use_case.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

final class HasAnyMachine extends UseCase<bool, void> {
  final StorageRepository _storageRepository;

  HasAnyMachine(this._storageRepository);

  @override
  Future<DataStatus<bool>> templateCall(void params) async {
    List<Machine> machines = await _storageRepository.getAllMachines();
    log('There is ${machines.length} machines', name: 'HasAnyMachine');
    return Future.value(DataSuccess(machines.isNotEmpty));
  }
}
