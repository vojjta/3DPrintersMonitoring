import 'dart:developer';

import 'package:printer_monitoring/application/commands/command.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

final class HasAnyMachineCmd implements AsyncCommand<bool> {
  final StorageRepository _storageRepository;

  HasAnyMachineCmd(this._storageRepository);

  @override
  Future<bool> execute() async {
    final machinesResult = await _storageRepository.getAllMachines();

    if (machinesResult.isSuccess) {
      log('There is ${machinesResult.success.length} machines', name: 'HasAnyMachine');

      return Future.value(machinesResult.success.isNotEmpty);
    }

    return Future.value(false);
  }
}
