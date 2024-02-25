import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/primitives/either.dart';
import 'package:printer_monitoring/domain/values/job_status.dart';
import 'package:printer_monitoring/domain/values/machine_info.dart';

abstract interface class MachineRepository {
  void setMachine(Machine machine);

  Future<Either<MachineRepositoryStatus, bool>> isRepositoryReady();

  Future<Either<MachineRepositoryStatus, MachineInfo>> getStatusInfo();

  Future<Either<MachineRepositoryStatus, JobStatus>> getJob();
}

/// TODO(Vojjta): Unify repository statuses
sealed class MachineRepositoryStatus {}

final class MachineRepositoryNotFound extends MachineRepositoryStatus {}

final class MachineRepositoryError extends MachineRepositoryStatus {
  final Exception exception;

  MachineRepositoryError(this.exception);

  @override
  String toString() {
    return exception.toString();
  }
}
