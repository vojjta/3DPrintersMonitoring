import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/entities/machine.dart';
import 'package:printer_monitoring/business/repository/machine_repository.dart';
import 'package:printer_monitoring/business/usecases/get_all_machines.dart';

part 'machine_event.dart';

part 'machine_state.dart';

class MachineBloc extends Bloc<MachineEvent, MachineState> {
  MachineBloc() : super(MachineInitial()) {


    on<LoadMachineEvent>((event, emit) async {
      final machinesStatus = await GeAllMachines(GetIt.I<MachineRepository>()).call();
      if (machinesStatus is DataSuccess && machinesStatus.data != null) {
        emit(MachineLoaded(machinesStatus.data!.first));
      } else {
        emit(MachineLoadError());
      }
    });
  }
}
