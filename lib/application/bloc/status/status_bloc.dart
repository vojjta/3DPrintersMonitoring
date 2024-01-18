import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:printer_monitoring/application/mappers/machine_mapper.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';

part 'status_event.dart';part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  StatusBloc() : super(StatusInitial()) {
    on<StatusRefreshPressed>((event, emit) async {
      MachineRepository? repository = GetIt.I.isRegistered<MachineRepository>() ? GetIt.I<MachineRepository>() : null;

      if (repository != null) {
        final readyResult = await repository.isRepositoryReady();

        if (readyResult.isSuccess) {
          final statusResult = await repository.getStatusInfo();
          if (statusResult.isSuccess) {
            log('Status loaded: ${statusResult.success}', name: 'StatusBloc');
            emit(MachineMapper.toStatusLoaded(statusResult.success));
            return;
          }
        }
        log('Status load error: ${readyResult.error}', name: 'StatusBloc');
        emit(StatusLoadError());
      }
    });
  }
}
