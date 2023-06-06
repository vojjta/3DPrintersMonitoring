import 'package:flutter/material.dart';
import 'package:printer_monitoring/presentation/di/di_init.dart';
import 'package:printer_monitoring/ui/pages/machine_page.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: MachinePage(),
      ),
    );
  }
}


