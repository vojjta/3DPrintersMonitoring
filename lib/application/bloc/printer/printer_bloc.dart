import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:printer_monitoring/application/common/l.dart';
import 'package:printer_monitoring/application/mappers/printer_mapper.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

part 'printer_event.dart';
part 'printer_state.dart';

class MachineBloc extends Bloc<PrinterEvent, PrinterState> with L {
  final StorageRepository _storageRepository;

  MachineBloc(this._storageRepository) : super(PrinterInitial()) {
    on<PrinterStarted>(_onPrinterStarted);
  }

  void _onPrinterStarted(PrinterStarted state, Emitter<PrinterState> emit) async {
    final machinesResult = await _storageRepository.getAllMachines();

    if (machinesResult.isSuccess && machinesResult.success.isNotEmpty) {
      return emit(
        PrinterMapper(machinesResult.success.first).toPrinterLoaded(),
      );
    }

    l.e('Printer load error: ${machinesResult.error.runtimeType}');
    emit(PrinterLoadFailure());
  }
}
