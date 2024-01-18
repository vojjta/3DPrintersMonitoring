import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:printer_monitoring/application/dto/printer_info.dart';
import 'package:printer_monitoring/application/usecases/add_machine.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

part 'add_printer_event.dart';
part 'add_printer_state.dart';

class AddPrinterBloc extends Bloc<AddPrinterEvent, AddPrinterState> {
  AddPrinterBloc() : super(AddPrinterInitial()) {
    on<AddPrinterCall>((event, emit) async {
      PrinterInfo printer = PrinterInfo.fromBasic(name: event.name, ip: event.address, port: event.port);

      final result = await AddMachineUseCase(GetIt.I<StorageRepository>()).call(params: printer).whenComplete(() {
        emit(AddPrinterSuccess());
      });
    });
  }
}
