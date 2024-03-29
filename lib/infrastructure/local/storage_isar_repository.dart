import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printer_monitoring/application/common/l.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/primitives/either.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';
import 'package:printer_monitoring/infrastructure/mappers/machine_mapper.dart';
import 'package:printer_monitoring/infrastructure/mappers/stored_machine_mapper.dart';
import 'package:printer_monitoring/infrastructure/model/hive/stored_machine.dart';

// TODO(vojjta): handle exceptions
final class StorageIsarRepository with L implements StorageRepository {
  Isar? _isar;
  bool _isOpened = false;

  @override
  Future<Either<StorageRepositoryStatus, void>> addMachine(Machine machine) async {
    await _isar?.writeTxn(() async {
      await _isar?.storedMachines.put(MachineMapper(machine).toStoredMachine());
    });
    return Future.value(Either.success(null));
  }

  Future<void> init() async {
    if (_isOpened) {
      return;
    }
    final Directory dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([StoredMachineSchema], directory: dir.path);
    _isOpened = true;
    l.d('Isar storage opened, path: ${_isar?.path}');
  }

  @override
  Future<Either<StorageRepositoryStatus, List<Machine>>> getAllMachines() async {
    return Future.value(
      Either.success(
        (await _isar?.storedMachines.where().findAll())
                ?.map(
                  (m) => StoredMachineMapper(m).toMachine(),
                )
                .toList() ??
            [],
      ),
    );
  }

  @override
  Future<Either<StorageRepositoryStatus, void>> removeMachine(int id) {
    // TODO: implement removeMachine
    throw UnimplementedError();
  }
}
