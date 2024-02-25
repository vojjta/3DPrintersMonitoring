import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:printer_monitoring/application/bloc/default_bloc_observer.dart';
import 'package:printer_monitoring/presentation/di/di_init.dart';
import 'package:printer_monitoring/presentation/navigation/routes.dart';
import 'package:printer_monitoring/presentation/printer_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  EquatableConfig.stringify = kDebugMode;

  await initDI();

  Bloc.observer = DefaultBlocObserver();

  final GoRouter router = await Routes.create();

  runApp(PrinterApp(router: router));
}
