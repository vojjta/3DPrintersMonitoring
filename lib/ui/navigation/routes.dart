import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:printer_monitoring/application/data_status.dart';
import 'package:printer_monitoring/application/usecases/has_any_machine.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';
import 'package:printer_monitoring/ui/pages/add_printer_page.dart';
import 'package:printer_monitoring/ui/pages/home_page.dart';

enum AppRoute {
  home('/'),
  addPrinter('/add-printer');

  final String path;

  const AppRoute(this.path);

  @override
  toString() => path;
}

final class Routes {
  Routes._();

  static Future<GoRouter> create() async {
    return GoRouter(
      initialLocation: await _initialRoute(),
      routes: [
        GoRoute(
          path: AppRoute.home.path,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRoute.addPrinter.path,
          builder: (context, state) => const AddPrinterPage(),
        ),
      ],
    );
  }

  static Future<String> _initialRoute() async {
    final DataStatus<bool> dataStatus = await HasAnyMachine(GetIt.I<StorageRepository>()).call();

    if (dataStatus is DataSuccess) {
      final bool hasPrinter = dataStatus.data ?? false;
      if (hasPrinter) {
        return AppRoute.home.path;
      }
    }
    return AppRoute.addPrinter.path;
  }
}
