import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/entities/machine_status.dart';
import 'package:printer_monitoring/business/repository/status_repository.dart';
import 'package:printer_monitoring/business/use_case.dart';

class GetStatus extends UseCase<MachineInfoEntity, void> {
  final StatusRepository _statusRepository;

  GetStatus(this._statusRepository);

  @override
  Future<DataStatus<MachineInfoEntity>> templateCall(void params) {
    final MachineInfoEntity? status = _statusRepository.getStatusInfo();
    if (status != null) {
      return Future.value(DataSuccess(status));
    }
    throw Exception('No status found');
  }
}
