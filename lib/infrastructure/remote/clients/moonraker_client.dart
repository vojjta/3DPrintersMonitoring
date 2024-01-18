import 'package:dio/dio.dart';
import 'package:printer_monitoring/infrastructure/model/json/printer_info_result.dart';
import 'package:printer_monitoring/infrastructure/model/json/printer_status_result.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'moonraker_client.g.dart';

@RestApi()
abstract class MoonrakerClient {
  factory MoonrakerClient(Dio dio, {String baseUrl}) = _MoonrakerClient;

  @GET('/printer/objects/query')
  Future<PrinterStatusResult> getPrinterStatus(@Query('heater_bed') String heaterBed,
      @Query('extruder') String extruder, @Query('print_stats') String printStats);

  @GET('/printer/info')
  Future<HttpResponse<PrinterInfoResult>> getPrinterInfo();
}
