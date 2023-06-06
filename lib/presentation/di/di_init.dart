import 'package:get_it/get_it.dart';
import 'package:printer_monitoring/business/repository/machine_repository.dart';
import 'package:printer_monitoring/data/local/mocked_local_repository.dart';

void initDI() {
  GetIt.I.registerSingleton<MachineRepository>(MockedLocalRepository());
}
