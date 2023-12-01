import 'package:printer_monitoring/domain/entities/job_status.dart';
import 'package:printer_monitoring/domain/entities/machine_info.dart';

abstract class StatusRepository {

  Future<bool> isRepositoryReady();

  Future<MachineInfoEntity?> getStatusInfo();

  Future<JobStatusEntity?> getJob();
}
