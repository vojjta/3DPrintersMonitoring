import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printer_monitoring/presentation/components/app_button.dart';
import 'package:printer_monitoring/presentation/components/machine_gauge.dart';

import './home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              BlocBuilder<MachineBloc, PrinterState>(builder: (_, final state) {
                return switch (state) {
                  PrinterLoadSuccess() => MachineGauge(
                      title: state.name,
                      value: 25,
                    ),
                  _ => const Text('Machine', style: TextStyle(fontSize: 24))
                };
              }),
              BlocBuilder<StatusBloc, StatusState>(
                builder: (_, state) {
                  return switch (state) {
                    StatusLoadSuccess() => Text('N: ${state.nozzleTemp}\nB: ${state.bedTemp}'),
                    _ => const SizedBox.shrink(),
                  };
                },
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          AppButton(
            text: 'Refresh',
            onPressed: () {
              context.read<StatusBloc>().add(StatusRefreshPressed());
            },
          )
        ],
      ),
    );
  }
}
