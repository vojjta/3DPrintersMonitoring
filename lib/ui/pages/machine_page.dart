import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printer_monitoring/presentation/bloc/machine/machine_bloc.dart';
import 'package:printer_monitoring/ui/components/app_button.dart';
import 'package:printer_monitoring/ui/components/machine_gauge.dart';

class MachinePage extends StatelessWidget {
  const MachinePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (_) => MachineBloc()..add(LoadMachineEvent()),
      child: Center(child: BlocBuilder<MachineBloc, MachineState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state is MachineLoaded
                  ? MachineGauge(
                      title: state.machine.name,
                      value: 25,
                    )
                  : const Text('Machine', style: TextStyle(fontSize: 24)),
              const SizedBox(
                height: 10,
              ),
              AppButton(
                text: 'Refresh',
                onPressed: () {
                  context.read<MachineBloc>().add(LoadMachineEvent());
                },
              )
            ],
          );
        },
      )),
    );
  }
}
