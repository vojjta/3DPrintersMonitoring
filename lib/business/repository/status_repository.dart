import 'package:printer_monitoring/business/entities/machine_status.dart';

abstract class StatusRepository {
  MachineStatusEntity? getStatus();
}
