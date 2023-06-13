import 'package:printer_monitoring/business/entities/machine_info.dart';

class MachineInfoModel extends MachineInfoEntity {
  MachineInfoModel._(super.state, super.bedTemp, super.nozzleTemp, super.message);

  factory MachineInfoModel.fromJson(Map<String, dynamic> json) {
    return MachineInfoModel._(
      json['print_stats']['state'],
      json['heater_bed']['temperature'],
      json['extruder']['temperature'],
      json['print_stats']['message'],
    );
  }
}
