import 'package:printer_monitoring/domain/primitives/either.dart';
import 'package:printer_monitoring/domain/value/job_status.dart';
import 'package:printer_monitoring/domain/value/machine_info.dart';

abstract interface class MachineRepository {
  Future<Either<MachineRepositoryStatus, bool>> isRepositoryReady();

  Future<Either<MachineRepositoryStatus, MachineInfo>> getStatusInfo();

  Future<Either<MachineRepositoryStatus,JobStatus>> getJob();
}

sealed class MachineRepositoryStatus{}

final class MachineRepositoryNotFound extends MachineRepositoryStatus{}
final class MachineRepositoryError extends MachineRepositoryStatus{
  final Exception exception;

  MachineRepositoryError(this.exception);

  @override
  String toString() {
    return exception.toString();
  }
}