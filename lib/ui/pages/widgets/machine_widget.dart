import 'package:flutter/material.dart';
import 'package:printer_monitoring/ui/components/machine_gauge.dart';

class MachineWidget extends StatelessWidget {
  final String title;
  final double value;

  const MachineWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [MachineGauge(title: title, value: value)],
    );
  }
}
