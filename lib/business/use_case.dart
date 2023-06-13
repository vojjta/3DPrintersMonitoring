import 'dart:developer';

import 'package:printer_monitoring/business/data_status.dart';

abstract class UseCase<Type, Params> {
  Future<DataStatus<Type>> call({Params? params}) async{
    try{
      return await templateCall(params);
    }on Exception catch(e){
      log('Use case error',error: e);
      return DataError(e);
    }
  }
  Future<DataStatus<Type>> templateCall(Params? params);
}