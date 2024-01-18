import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:printer_monitoring/presentation/di/di_init.dart';
import 'package:printer_monitoring/presentation/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDI();

  final GoRouter router = await Routes.create();

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
