import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:printer_monitoring/data/remote/api_response.dart';

abstract class ApiRequest<Params> {
  final String address;

  ApiRequest(this.address);

  Future<ApiResponse> call(final String url, {final Params params});
}

class GetApiRequest extends ApiRequest<void> {
  final Dio dio;

  GetApiRequest(this.dio, final String address) : super(address);

  @override
  Future<ApiResponse> call(final String url, {void params}) async {
    try {
      final response = await dio.get('http://$address$url');
      log('GetApiRequestSuccess, ${response.data.toString()}');
      return SuccessApiResponse.withData(response);
    } on DioException catch (e) {
      log('GetApiRequestFailed', error: e);
      return FailedApiResponse(e.response, e);
    }
  }
}
