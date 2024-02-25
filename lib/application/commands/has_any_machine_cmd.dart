import 'package:printer_monitoring/application/commands/command.dart';
import 'package:printer_monitoring/application/common/l.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

final class HasAnyMachineCmd with L implements AsyncCommand<bool> {
  final StorageRepository _storageRepository;

  HasAnyMachineCmd(this._storageRepository);

  @override
  Future<bool> execute() async {
    final machinesResult = await _storageRepository.getAllMachines();

    if (machinesResult.isSuccess) {
      l.d('There is ${machinesResult.success.length} machines');

      return machinesResult.success.isNotEmpty;
    }

    return false;
  }
}
