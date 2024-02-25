import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:printer_monitoring/application/commands/has_any_machine_cmd.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';
import 'package:printer_monitoring/presentation/navigation/app_routes.dart';
import 'package:printer_monitoring/presentation/pages/add_printer/add_printer_page.dart';
import 'package:printer_monitoring/presentation/pages/home/home_page.dart';

final class Routes {
  Routes._();

  static Future<GoRouter> create() async {
    return GoRouter(
      initialLocation: await _initialRoute(),
      routes: [
        GoRoute(
          path: AppRoutes.home.path,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRoutes.addPrinter.path,
          builder: (context, state) => const AddPrinterPage(),
        ),
      ],
    );
  }

  static Future<String> _initialRoute() async {
    final hasMachine = await HasAnyMachineCmd(GetIt.I<StorageRepository>()).execute();

    if (hasMachine) {
      return AppRoutes.home.path;
    }
    return AppRoutes.addPrinter.path;
  }
}
