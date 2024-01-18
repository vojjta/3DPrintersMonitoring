import 'package:printer_monitoring/application/use_case_exception.dart';

abstract class DataStatus<Type> {
  final Type? data;
  final UseCaseException? e;

  DataStatus({this.data, this.e});

  bool get hasError => e != null;

  bool get hasData => data != null;
}

final class DataSuccess<Type> extends DataStatus<Type> {
  DataSuccess(Type data) : super(data: data);
}

final class DataError<Type> extends DataStatus<Type> {
  DataError(UseCaseException e) : super(e: e);
}
