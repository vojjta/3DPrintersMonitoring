import 'package:printer_monitoring/domain/value/job_status.dart';
import 'package:printer_monitoring/domain/value/machine_info.dart';

abstract interface class MachineRepository {
  Future<bool> isRepositoryReady();

  Future<MachineInfo?> getStatusInfo();

  Future<JobStatus?> getJob();
}
