import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/entities/machine_info.dart';
import 'package:printer_monitoring/business/repository/status_repository.dart';
import 'package:printer_monitoring/business/usecases/get_machine_status.dart';
import 'package:printer_monitoring/presentation/bloc/machine/machine_bloc.dart';

part 'status_event.dart';

part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  StatusBloc() : super(StatusInitial()) {
    on<StatusEvent>((event, emit) async {
      StatusRepository? repository = GetIt.I.isRegistered<StatusRepository>() ? GetIt.I<StatusRepository>() : null;
      if (repository != null) {
        final status = await GetMachineStatus(repository!).call();
        if (status is DataSuccess) {
          emit(StatusLoaded(status.data!));
          return;
        }
      }
      emit(StatusLoadError());
    });
  }
}
