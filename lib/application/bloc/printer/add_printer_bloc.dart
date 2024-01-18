import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

part 'add_printer_event.dart';
part 'add_printer_state.dart';

class AddPrinterBloc extends Bloc<AddPrinterEvent, AddPrinterState> {
  AddPrinterBloc() : super(AddPrinterInitial()) {
    on<AddPrinterCall>((event, emit) async {
      final repository = GetIt.I<StorageRepository>();

      repository.addMachine(Machine.createNew(event.name, event.address, port: event.port));

      emit(AddPrinterSuccess());
    });
  }
}
