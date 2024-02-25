import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:printer_monitoring/application/common/l.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

part 'add_printer_event.dart';

part 'add_printer_state.dart';

class AddPrinterBloc extends Bloc<AddPrinterEvent, AddPrinterState> with L {
  final StorageRepository _storageRepository;

  AddPrinterBloc(this._storageRepository) : super(AddPrinterInitial()) {
    on<AddPrinterPressed>(_addPrinterPressed);
  }

  void _addPrinterPressed(AddPrinterPressed event, Emitter<AddPrinterState> emit) async {
    final result = await _storageRepository.addMachine(Machine.createNew(event.name, event.address, port: event.port));

    if (result.isSuccess) {
      l.d('Printer added: ${event.name}');
      return emit(AddPrinterSuccess());
    }

    l.w('Add printer error: ${result.error.runtimeType}');
    emit(AddPrinterFailure());
  }
}
