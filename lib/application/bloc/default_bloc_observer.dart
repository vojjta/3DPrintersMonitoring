import 'package:bloc/bloc.dart';
import 'package:printer_monitoring/application/common/l.dart';

final class DefaultBlocObserver extends BlocObserver with L {
  @override
  void onEvent(Bloc bloc, Object? event) {
    l.i('Bloc Observer(event: ${event.runtimeType})');
    super.onEvent(bloc, event);
  }
}
