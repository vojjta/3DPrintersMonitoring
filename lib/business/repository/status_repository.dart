import 'package:printer_monitoring/business/entities/job_status.dart';
import 'package:printer_monitoring/business/entities/machine_status.dart';

abstract class StatusRepository {
  MachineInfoEntity? getStatusInfo();

  JobStatusEntity? getJob();
}
