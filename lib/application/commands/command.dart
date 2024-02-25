@Deprecated('Use [Cubit] instead [Command]')
abstract interface class Command<T> {
  T execute();
}

@Deprecated('Use [Cubit] instead [AsyncCommand]')
abstract interface class AsyncCommand<T> extends Command<Future<T>> {
  @override
  Future<T> execute();
}
