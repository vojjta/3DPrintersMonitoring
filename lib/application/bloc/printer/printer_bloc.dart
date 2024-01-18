import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:printer_monitoring/application/bloc/printer/printer_state.dart';
import 'package:printer_monitoring/application/mappers/machine_mapper.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';
import 'package:printer_monitoring/infrastructure/remote/status_moonraker_repository.dart';

part 'printer_event.dart';

class MachineBloc extends Bloc<MachineEvent, PrinterState> {
  MachineBloc() : super(InitialNoPrinter()) {
    on<MachineLoadCall>((_, final emit) async {
      final repository = GetIt.I<StorageRepository>();

      final machinesResult = await repository.getAllMachines();

      if (machinesResult.isSuccess && machinesResult.success.isNotEmpty) {
        if (!GetIt.instance.isRegistered<MachineRepository>()) {
          GetIt.I.registerSingleton<MachineRepository>(
              StatusMoonrakerRepository(machinesResult.success.first.httpAddress));
        }
        emit(MachineMapper.toPrinterLoaded(machinesResult.success.first));
        return;
      }

      emit(PrinterLoadError());
    });
  }
}
