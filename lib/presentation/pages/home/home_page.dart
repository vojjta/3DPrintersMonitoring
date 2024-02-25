import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import './home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MachineBloc>(
          create: (_) => MachineBloc(
            GetIt.I<StorageRepository>(),
          )..add(
              PrinterStarted(),
            ),
        ),
        BlocProvider<StatusBloc>(
          create: (_) => StatusBloc(
            GetIt.I<MachineRepository>(),
            GetIt.I<StorageRepository>(),
          )..add(
              StatusRefreshPressed(),
            ),
        ),
      ],
      child: const HomeView(),
    );
  }
}
