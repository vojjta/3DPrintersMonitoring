import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/entities/machine.dart';
import 'package:printer_monitoring/business/repository/machine_repository.dart';
import 'package:printer_monitoring/business/use_case.dart';

class GeAllMachines extends UseCase<List<MachineEntity>, void> {
  final MachineRepository _machineRepository;

  GeAllMachines(this._machineRepository);

  @override
  Future<DataStatus<List<MachineEntity>>> templateCall(void params) {
    final List<MachineEntity> machines = _machineRepository.getAllMachines();

    if (machines.isNotEmpty) {
      return Future.value(DataSuccess(machines));
    }

    throw Exception('No machines found');
  }
}
