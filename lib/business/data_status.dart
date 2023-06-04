abstract class DataStatus<Type> {
  final Type? data;
  final Exception? e;

  DataStatus({this.data, this.e});

  bool get hasError => e != null;

  bool get hasData => data != null;
}

class DataSuccess<Type> extends DataStatus<Type> {
  DataSuccess(Type data) : super(data: data);
}

class DataError<Type> extends DataStatus<Type> {
  DataError(Exception e) : super(e: e);
}
