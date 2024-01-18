import 'package:printer_monitoring/application/command.dart';
import 'package:printer_monitoring/application/dto/printer_info.dart';
import 'package:printer_monitoring/application/mappers/printer_mapper.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

final class AddMachineCmd implements AsyncCommand<void> {
  final StorageRepository _storageRepository;
  final PrinterInfo _printerInfo;

  AddMachineCmd(this._storageRepository, this._printerInfo);

  @override
  Future<void> execute() async {
    final Machine machine = PrinterMapper.toMachine(_printerInfo);

    _storageRepository.addMachine(machine);
  }
}
