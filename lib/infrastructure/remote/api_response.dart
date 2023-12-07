import 'dart:convert';

import 'package:dio/dio.dart';

abstract class ApiResponse {
  late final int? statusCode;
  late final Map<String, dynamic>? jsonData;
  Exception? exception;
  String? message;

  bool get isStatusOk => statusCode == 200;

  bool get hasData => jsonData != null;

  bool get isStatusOkHasData => isStatusOk && hasData;

  ApiResponse(final Response? response) {
    statusCode = response?.statusCode ?? 0;
  }
}

class SuccessApiResponse extends ApiResponse {
  SuccessApiResponse.withoutData(Response response) : super(response) {
    jsonData = null;
  }

  SuccessApiResponse.withData(Response response) : super(response) {
    if (isStatusOk) {
      jsonData = response.data;
    }
  }
}

class FailedApiResponse extends ApiResponse {
  FailedApiResponse(final Response? response, final Exception e, {final String? message}) : super(response) {
    exception = e;
    this.message = message ?? (response?.statusMessage ?? 'Message was`t provided');
  }
}
