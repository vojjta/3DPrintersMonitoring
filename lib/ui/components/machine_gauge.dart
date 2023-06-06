import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MachineGauge extends StatelessWidget {
  final String title;
  final double value;

  const MachineGauge({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      backgroundColor: Colors.transparent,
      title: GaugeTitle(text: title, textStyle: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
      axes: [

        RadialAxis(
          startAngle: 90,
          endAngle: 360,
          minimum: 0,
          maximum: 100,
          axisLineStyle: const AxisLineStyle(
            cornerStyle: CornerStyle.bothCurve,
          ),
          ranges: [GaugeRange(startValue: 0, endValue: 0, )],
          // annotations: [GaugeAnnotation(widget: Text('0')) ,],
          pointers: [RangePointer(value: value, color: Colors.red.shade200,)],
        )
      ],
    );
  }
}
