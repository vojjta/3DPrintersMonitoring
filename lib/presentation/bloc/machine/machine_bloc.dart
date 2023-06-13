import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/entities/machine.dart';
import 'package:printer_monitoring/business/entities/machine_info.dart';
import 'package:printer_monitoring/business/repository/machine_repository.dart';
import 'package:printer_monitoring/business/repository/status_repository.dart';
import 'package:printer_monitoring/business/usecases/get_all_machines.dart';
import 'package:printer_monitoring/business/usecases/get_machine_status.dart';
import 'package:printer_monitoring/data/remote/simple_moonraker_rest_api.dart';

part 'machine_event.dart';

part 'machine_state.dart';

class MachineBloc extends Bloc<MachineEvent, MachineState> {
  MachineBloc() : super(InitialNoMachine()) {
    on<MachineLoadCall>((_, final emit) async {
      final machinesStatus = await GetAllMachines(GetIt.I<MachineRepository>()).call();
      if (machinesStatus is DataSuccess && machinesStatus.data != null) {
        if (!GetIt.instance.isRegistered<StatusRepository>()) {
          GetIt.I.registerSingleton<StatusRepository>(SimpleMoonrakerRestAPI(machinesStatus.data!.first.address));
        }
        emit(MachineLoaded(machinesStatus.data!.first));
      } else {
        emit(MachineLoadError());
      }
    });
  }
}
