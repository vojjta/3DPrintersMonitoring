import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:printer_monitoring/presentation/navigation/app_routes.dart';

import './add_printer.dart';

class AddPrinterPage extends StatefulWidget {
  const AddPrinterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddPrinterPageState();
  }
}

class _AddPrinterPageState extends State<AddPrinterPage> {
  @override
  Widget build(BuildContext ctx) => BlocProvider(
        create: (ctx) => AddPrinterBloc(
          GetIt.I<StorageRepository>(),
        ),
        child: BlocListener<AddPrinterBloc, AddPrinterState>(
          listener: (context, state) {
            if (state is AddPrinterSuccess) {
              context.go(AppRoutes.home.path);
            }
          },
          child: const AddPrinterView(),
        ),
      );
}
