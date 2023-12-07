import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/exceptions/add_machine_exception.dart';
import 'package:printer_monitoring/business/use_case.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';

final class AddMachineUseCase extends UseCase<bool, Machine> {
  final MachineRepository _machineRepository;

  AddMachineUseCase(this._machineRepository);

  @override
  Future<DataStatus<bool>> templateCall(Machine? params) async {
    if (params == null) {
      throw AddMachineException('Machine params cannot be null');
    }
    switch (_machineRepository.addMachine(params)) {
      case true:
        return DataSuccess(true);
      case false:
        throw AddMachineException('Error saving machine');
    }
  }
}
