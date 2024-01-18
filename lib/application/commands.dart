abstract interface class Command<T> {
  T execute();
}

abstract interface class AsyncCommand<T> {
  Future<T> execute();
}
