import 'package:printer_monitoring/business/use_case_exception.dart';
import 'package:printer_monitoring/domain/repositories/status_repository.dart';

final class GetMachineException extends UseCaseException {
  final StatusRepository? _repository;

  GetMachineException(super.message, {StatusRepository? repository}) : _repository = repository;

  @override
  String toString() {
    if (_repository != null) {
      return 'GetMachineException [${_repository.runtimeType}]: $message';
    }
    return 'GetMachineException: $message';
  }
}
