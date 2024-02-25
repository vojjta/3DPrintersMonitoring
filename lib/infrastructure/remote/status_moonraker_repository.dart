import 'package:dio/dio.dart';
import 'package:printer_monitoring/application/common/l.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/primitives/either.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';
import 'package:printer_monitoring/domain/values/job_status.dart';
import 'package:printer_monitoring/domain/values/machine_info.dart';
import 'package:printer_monitoring/infrastructure/mappers/printer_status_mapper.dart';
import 'package:printer_monitoring/infrastructure/model/json/printer_info_result.dart';
import 'package:printer_monitoring/infrastructure/model/json/printer_status_result.dart';
import 'package:printer_monitoring/infrastructure/remote/clients/moonraker_client.dart';
import 'package:retrofit/dio.dart';

final class StatusMoonrakerRepository with L implements MachineRepository {
  // TODO(Vojjta): remove this client dependency to make it more testable
  MoonrakerClient? _client;

  @override
  Future<Either<MachineRepositoryStatus, JobStatus>> getJob() {
    // TODO: implement getJob
    throw UnimplementedError();
  }

  @override
  Future<Either<MachineRepositoryStatus, MachineInfo>> getStatusInfo() async {
    assert(_client != null, 'Machine address not set');
    try {
      final PrinterStatusResult result = await _client!.getPrinterStatus('temperature', 'temperature', 'state,message');
      l.d('Status info result: $result');
      return Either.success(PrinterStatusMapper(result).toMachineInfo());
    } on DioException catch (e) {
      l.e('Can not fetch status info pro API', error: e);
      return Either.error(MachineRepositoryError(e));
    }
  }

  @override
  Future<Either<MachineRepositoryStatus, bool>> isRepositoryReady() async {
    assert(_client != null, 'Machine address not set');

    try {
      final HttpResponse<PrinterInfoResult> info = await _client!.getPrinterInfo();
      if (info.response.statusCode == 200) {
        l.d('Connection to printer verified');
        l.d('${info.data}');
        return Either.success(true);
      }
    } on DioException catch (e) {
      l.d('Can not verify connection to printer', error: e);
      return Either.error(MachineRepositoryError(e));
    }
    return Either.success(false);
  }

  @override
  void setMachine(Machine machine) {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 500),
      receiveTimeout: const Duration(seconds: 1),
    );
    _client = MoonrakerClient(Dio(options), baseUrl: machine.httpAddress);
  }
}
