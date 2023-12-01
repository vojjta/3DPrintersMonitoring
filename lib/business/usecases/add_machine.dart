import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/use_case.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repository/machine_repository.dart';

class AddMachineUseCase extends UseCase<bool, MachineEntity> {
  final MachineRepository _machineRepository;

  AddMachineUseCase(this._machineRepository);

  @override
  Future<DataStatus<bool>> templateCall(MachineEntity? params) async {
    if (params == null) {
      throw Exception('Machine params cannot be null');
    }
    switch (_machineRepository.addMachine(params)) {
      case true:
        return DataSuccess(true);
      case false:
        throw Exception('Error saving machine');
    }
  }
}
