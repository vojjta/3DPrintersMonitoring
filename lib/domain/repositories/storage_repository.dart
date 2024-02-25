import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/primitives/either.dart';

abstract interface class StorageRepository {
  Future<Either<StorageRepositoryStatus, void>> addMachine(Machine machine);

  Future<Either<StorageRepositoryStatus, List<Machine>>> getAllMachines();

  Future<Either<StorageRepositoryStatus, void>> removeMachine(int id);
}

/// TODO(Vojjta): Unify repository statuses
sealed class StorageRepositoryStatus {}

final class StorageRepositoryError extends StorageRepositoryStatus {
  final Exception exception;

  StorageRepositoryError(this.exception);

  @override
  String toString() {
    return exception.toString();
  }
}
