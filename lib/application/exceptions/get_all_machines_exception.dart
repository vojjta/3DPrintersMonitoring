import 'package:printer_monitoring/application/use_case_exception.dart';

final class GetAllMachinesException extends UseCaseException {
  GetAllMachinesException(super.message);

  @override
  String toString() {
    return 'GetAllMachinesException: $message';
  }
}
