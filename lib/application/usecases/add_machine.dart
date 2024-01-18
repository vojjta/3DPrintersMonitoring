import 'package:printer_monitoring/application/data_status.dart';
import 'package:printer_monitoring/application/dto/printer_info.dart';
import 'package:printer_monitoring/application/exceptions/add_machine_exception.dart';
import 'package:printer_monitoring/application/mappers/printer_mapper.dart';
import 'package:printer_monitoring/application/use_case.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

final class AddMachineUseCase extends UseCase<void, PrinterInfo> {
  final StorageRepository _storageRepository;

  AddMachineUseCase(this._storageRepository);

  @override
  Future<DataStatus<void>> templateCall(PrinterInfo? params) async {
    if (params == null) {
      throw AddMachineException('Machine params cannot be null');
    }
    await _storageRepository.addMachine(PrinterMapper.toMachine(params));

    return DataSuccess(null);
  }
}
