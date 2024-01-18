import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:printer_monitoring/domain/repositories/machine_repository.dart';
import 'package:printer_monitoring/domain/value/job_status.dart';
import 'package:printer_monitoring/domain/value/machine_info.dart';
import 'package:printer_monitoring/infrastructure/model/json/printer_info_result.dart';
import 'package:printer_monitoring/infrastructure/model/json/printer_status_result.dart';
import 'package:printer_monitoring/infrastructure/remote/clients/moonraker_client.dart';
import 'package:retrofit/dio.dart';

final class StatusMoonrakerRepository implements MachineRepository {
  late final MoonrakerClient _client;

  StatusMoonrakerRepository(final String baseUrl) {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 500),
      receiveTimeout: const Duration(seconds: 1),
    );
    _client = MoonrakerClient(Dio(options), baseUrl: baseUrl);
  }

  @override
  Future<JobStatus?> getJob() {
    // TODO: implement getJob
    throw UnimplementedError();
  }

  @override
  Future<MachineInfo?> getStatusInfo() async {
    try {
      final PrinterStatusResult result = await _client.getPrinterStatus('temperature', 'temperature', 'state,message');
      log('Status info result: $result', name: 'StatusMoonrakerRepository');
      return result.toMachineInfo();
    } on DioException catch (e) {
      log('Can not fetch status info pro API', error: e, name: 'StatusMoonrakerRepository');
    }
    return null;
  }

  @override
  Future<bool> isRepositoryReady() async {
    try {
      final HttpResponse<PrinterInfoResult> info = await _client.getPrinterInfo();

      if (info.response.statusCode == 200) {
        log('Connection to printer verified', name: 'StatusMoonrakerRepository');
        log('${info.data}', name: 'StatusMoonrakerRepository');
        return true;
      }
    } on DioException catch (e) {
      log('Can not verify connection to printer', error: e, name: 'StatusMoonrakerRepository');
    }
    return false;
  }
}
