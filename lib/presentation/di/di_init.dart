import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';
import 'package:printer_monitoring/infrastructure/local/storage_isar_repository.dart';

Future<void> initDI() async {
  final Completer<void> complete = Completer();

  GetIt.I.registerSingletonAsync<StorageRepository>(() async {
    final storage = StorageIsarRepository();
    await storage.init();
    return storage;
  });

  GetIt.I.allReady().then((_) => complete.complete());

  return complete.future;
}
