import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printer_monitoring/presentation/bloc/printer/printer_bloc.dart';
import 'package:printer_monitoring/presentation/bloc/status/status_bloc.dart';
import 'package:printer_monitoring/ui/components/app_button.dart';
import 'package:printer_monitoring/ui/components/machine_gauge.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<MachineBloc>(create: (_) => MachineBloc()..add(MachineLoadCall())),
          BlocProvider<StatusBloc>(create: (_) => StatusBloc()),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                BlocBuilder<MachineBloc, PrinterState>(builder: (_, final state) {
                  return state is PrinterLoaded
                      ? MachineGauge(
                          title: state.printer.name,
                          value: 25,
                        )
                      : const Text('Machine', style: TextStyle(fontSize: 24));
                }),
                BlocBuilder<StatusBloc, StatusState>(
                    // bloc: statusBloc,
                    builder: (_, state) {
                  return state is StatusLoaded
                      ? Text('N: ${state.status.nozzleTemp}\nB: ${state.status.bedTemp}')
                      : const SizedBox.shrink();
                })
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Builder(
              builder: (context) {
                return AppButton(
                  text: 'Refresh',
                  onPressed: () {
                    BlocProvider.of<StatusBloc>(context).add(StatusRefreshPressed());
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
