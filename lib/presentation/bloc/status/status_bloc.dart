import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:printer_monitoring/application/data_status.dart';
import 'package:printer_monitoring/application/usecases/get_machine_status.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';
import 'package:printer_monitoring/domain/value/machine_info.dart';

part 'status_event.dart';
part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  StatusBloc() : super(StatusInitial()) {
    on<StatusRefreshPressed>((event, emit) async {
      MachineRepository? repository = GetIt.I.isRegistered<MachineRepository>() ? GetIt.I<MachineRepository>() : null;

      if (repository != null) {
        final DataStatus status = await GetMachineStatus(repository).call();

        if (status is DataSuccess) {
          emit(StatusLoaded(status.data!));
          return;
        }
      }

      emit(StatusLoadError());
    });
  }
}
