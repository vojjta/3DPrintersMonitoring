import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:printer_monitoring/application/commands/has_any_machine_cmd.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';
import 'package:printer_monitoring/presentation/pages/add_printer_page.dart';
import 'package:printer_monitoring/presentation/pages/home_page.dart';

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
    final hasMachine = await HasAnyMachineCmd(GetIt.I<StorageRepository>()).execute();

    if (hasMachine) {
      return AppRoute.home.path;
    }
    return AppRoute.addPrinter.path;
  }
}
