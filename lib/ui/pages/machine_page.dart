import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printer_monitoring/presentation/bloc/machine/machine_bloc.dart';
import 'package:printer_monitoring/presentation/bloc/status/status_bloc.dart';
import 'package:printer_monitoring/ui/components/app_button.dart';
import 'package:printer_monitoring/ui/components/machine_gauge.dart';

class MachinePage extends StatelessWidget {
  const MachinePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
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
              BlocBuilder<MachineBloc, MachineState>(builder: (_, final state) {
                return state is MachineLoaded
                    ? MachineGauge(
                        title: state.machine.name,
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
          BlocBuilder<StatusBloc, StatusState>(
            builder: (context, state) {
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
    );
  }
}
