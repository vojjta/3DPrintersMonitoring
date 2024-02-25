import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrinterApp extends StatelessWidget {
  final GoRouter router;

  const PrinterApp({super.key, required this.router});

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
