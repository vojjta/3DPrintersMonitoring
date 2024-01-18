import 'package:printer_monitoring/application/use_case_exception.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';

final class GetMachineException extends UseCaseException {
  final MachineRepository? _repository;

  GetMachineException(super.message, {MachineRepository? repository}) : _repository = repository;

  @override
  String toString() {
    if (_repository != null) {
      return 'GetMachineException [${_repository.runtimeType}]: $message';
    }
    return 'GetMachineException: $message';
  }
}
