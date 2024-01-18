import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:printer_monitoring/application/data_status.dart';
import 'package:printer_monitoring/application/dto/printer_info.dart';
import 'package:printer_monitoring/application/usecases/get_all_printers.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';
import 'package:printer_monitoring/infrastructure/remote/status_moonraker_repository.dart';

part 'printer_event.dart';
part 'printer_state.dart';

class MachineBloc extends Bloc<MachineEvent, PrinterState> {
  MachineBloc() : super(InitialNoPrinter()) {
    on<MachineLoadCall>((_, final emit) async {
      final DataStatus<List<PrinterInfo>> machinesStatus = await GetAllPrinters(GetIt.I<StorageRepository>()).call();

      if (machinesStatus is DataSuccess && machinesStatus.data != null) {
        if (!GetIt.instance.isRegistered<MachineRepository>()) {
          GetIt.I
              .registerSingleton<MachineRepository>(StatusMoonrakerRepository(machinesStatus.data!.first.httpAddress));
        }
        emit(PrinterLoaded(machinesStatus.data!.first));
      } else {
        emit(PrinterLoadError());
      }
    });
  }
}
