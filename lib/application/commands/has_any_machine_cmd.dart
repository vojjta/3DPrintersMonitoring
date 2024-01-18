import 'dart:developer';

import 'package:printer_monitoring/application/commands.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

final class HasAnyMachineCmd implements AsyncCommand<bool> {
  final StorageRepository _storageRepository;

  HasAnyMachineCmd(this._storageRepository);

  @override
  Future<bool> execute() async {
    List<Machine> machines = await _storageRepository.getAllMachines();

    log('There is ${machines.length} machines', name: 'HasAnyMachine');

    return Future.value(machines.isNotEmpty);
  }
}
