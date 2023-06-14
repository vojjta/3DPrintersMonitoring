import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:printer_monitoring/business/entities/job_status.dart';
import 'package:printer_monitoring/business/entities/machine_info.dart';
import 'package:printer_monitoring/business/repository/status_repository.dart';
import 'package:printer_monitoring/data/model/machine_info_model.dart';
import 'package:printer_monitoring/data/remote/api_request.dart';

class SimpleMoonrakerRestAPI implements StatusRepository {
  // API urls
  final String printerInfo = '/printer/info';
  final String machineInfo =
      '/printer/objects/query?heater_bed=temperature&extruder=temperature&print_stats=state,message';

  final String address;
  late final Dio dio;

  SimpleMoonrakerRestAPI(this.address) {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 500),
      receiveTimeout: const Duration(seconds: 1),
    );
    dio = Dio(options);
  }

  @override
  Future<JobStatusEntity?> getJob() {
    // TODO: implement getJob
    throw UnimplementedError();
  }

  @override
  Future<MachineInfoEntity?> getStatusInfo() async {
    final apiResponse = await GetApiRequest(dio, address).call(machineInfo);
    if (apiResponse.isStatusOk) {
      return MachineInfoModel.fromJson(apiResponse.jsonData!['result']['status']);
    }
    return null;
  }

  @override
  Future<bool> isRepositoryReady() async {
    final apiResponse = await GetApiRequest(dio, address).call(printerInfo);
    log('SimpleMoonrakerRestAPI, isRepositoryReady: ${apiResponse.isStatusOk}');
    return apiResponse.isStatusOk;
  }
}
