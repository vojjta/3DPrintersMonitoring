import 'package:printer_monitoring/application/use_case_exception.dart';

final class AddMachineException extends UseCaseException {
  AddMachineException(super.message);

  @override
  String toString() {
    return 'AddMachineException: $message';
  }
}
