import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';
import 'package:printer_monitoring/infrastructure/local/storage_isar_repository.dart';
import 'package:printer_monitoring/infrastructure/remote/status_moonraker_repository.dart';

Future<void> initDI() async {
  final Completer<void> complete = Completer();

  final getIt = GetIt.I;

  getIt.registerSingleton<Logger>(Logger());

  getIt.registerSingletonAsync<StorageRepository>(() async {
    final storage = StorageIsarRepository();
    await storage.init();
    return storage;
  });

  getIt.registerFactory<MachineRepository>(() => StatusMoonrakerRepository());

  getIt.allReady().then((_) => complete.complete());

  return complete.future;
}
