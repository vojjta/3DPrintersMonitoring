import 'dart:developer';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';
import 'package:printer_monitoring/infrastructure/model/hive/stored_machine.dart';

final class StorageIsarRepository implements StorageRepository {
  Isar? _isar;
  bool _isOpened = false;
  @override
  Future<void> addMachine(Machine machine) async {
    await _isar?.writeTxn(() async {
      await _isar?.storedMachines.put(StoredMachine.fromMachine(machine));
    });
  }

  Future<void> init() async {
    if (_isOpened) {
      return;
    }
    final Directory dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([StoredMachineSchema], directory: dir.path);
    _isOpened = true;
    log('Isar storage opened, path: ${_isar?.path}');
  }

  @override
  Future<List<Machine>> getAllMachines() async =>
      (await _isar?.storedMachines.where().findAll())?.map((m) => m.toMachine()).toList() ?? [];

  @override
  bool removeMachine(int id) {
    // TODO: implement removeMachine
    throw UnimplementedError();
  }
}
