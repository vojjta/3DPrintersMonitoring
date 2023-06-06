import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printer_monitoring/presentation/bloc/machine/machine_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MachinePage extends StatelessWidget {
   MachinePage({super.key});

final myBloc = MachineBloc();

  @override
  Widget build(final BuildContext context) {
    return Center(
        child: BlocProvider<MachineBloc>(
      create: (_) => MachineBloc(),
      child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<MachineBloc, MachineState>(
                bloc: myBloc,
                builder: (_, state) {
                  if (state is MachineLoaded) {
                    return Text(state.machine.name, style: const TextStyle(fontSize: 24));
                  }
                  return Text('Machine Page', style: TextStyle(fontSize: 24));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SfRadialGauge(),
              ElevatedButton(
                  onPressed: () => {myBloc.add(LoadMachineEvent())}, child: Text("refresh")),
            ],
          )),
    ));
  }
}
