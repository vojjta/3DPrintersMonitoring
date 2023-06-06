import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printer_monitoring/presentation/bloc/machine/machine_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MachinePage extends StatelessWidget {
  const MachinePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (_) => MachineBloc(),
      child: Center(child: BlocBuilder<MachineBloc, MachineState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state is MachineLoaded
                  ? Text(state.machine.name, style: const TextStyle(fontSize: 24))
                  : const Text('Machine Page', style: TextStyle(fontSize: 24)),
              const SizedBox(
                height: 10,
              ),
              SfRadialGauge(),
              ElevatedButton(
                  onPressed: () => {context.read<MachineBloc>().add(LoadMachineEvent())}, child: const Text("Refresh")),
            ],
          );
        },
      )),
    );
  }
}
