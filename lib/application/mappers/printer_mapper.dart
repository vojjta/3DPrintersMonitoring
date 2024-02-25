import 'package:printer_monitoring/application/bloc/printer/printer_bloc.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';

final class PrinterMapper {
  final Machine _machine;

  PrinterMapper(this._machine);

  PrinterLoadSuccess toPrinterLoaded() {
    return PrinterLoadSuccess(
      name: _machine.name,
    );
  }
}
