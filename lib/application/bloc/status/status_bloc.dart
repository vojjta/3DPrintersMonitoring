import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:printer_monitoring/application/common/l.dart';
import 'package:printer_monitoring/application/mappers/printer_info_mapper.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

part 'status_event.dart';
part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> with L {
  final MachineRepository _machineRepository;
  final StorageRepository _storageRepository;

  StatusBloc(this._machineRepository, this._storageRepository) : super(StatusInitial()) {
    on<StatusRefreshPressed>(_onRefreshPressed);
  }

  void _onRefreshPressed(StatusRefreshPressed event, Emitter<StatusState> emit) async {
    final storageResult = await _storageRepository.getAllMachines();
    // load machine from storage
    if (storageResult.isError) {
      return emit(StatusLoadFailure());
    }
    // set machine to remote storage
    _machineRepository.setMachine(storageResult.success.first);

    // check if repository is ready
    final readyResult = await _machineRepository.isRepositoryReady();

    if (readyResult.isSuccess && readyResult.success) {
      // get status info
      final statusResult = await _machineRepository.getStatusInfo();
      if (statusResult.isSuccess) {
        l.d('Status loaded: ${statusResult.success}');
        return emit(PrinterInfoMapper(statusResult.success).toStatusLoaded());
      }
    }
    l.w('Status load error: ${readyResult.error.runtimeType}');
    emit(StatusLoadFailure());
  }
}
