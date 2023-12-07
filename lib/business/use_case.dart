import 'dart:developer';

import 'package:printer_monitoring/business/data_status.dart';
import 'package:printer_monitoring/business/use_case_exception.dart';

abstract class UseCase<Type, Params> {
  Future<DataStatus<Type>> call({Params? params}) async {
    try {
      return await templateCall(params);
    } on UseCaseException catch (e) {
      log('Use case error', error: e, name: 'UseCase');
      return DataError(e);
    }
  }

  Future<DataStatus<Type>> templateCall(Params? params);
}
