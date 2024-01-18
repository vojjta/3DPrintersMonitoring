// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_info_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrinterInfoResult _$PrinterInfoResultFromJson(Map<String, dynamic> json) =>
    PrinterInfoResult(
      stateMessage: json['state_message'] as String,
      klipperPath: json['klipper_path'] as String,
      configFile: json['config_file'] as String,
      softwareVersion: json['software_version'] as String,
      hostname: json['hostname'] as String,
      cpuInfo: json['cpu_info'] as String,
      state: json['state'] as String,
      pythonPath: json['python_path'] as String,
      logFile: json['log_file'] as String,
    );

Map<String, dynamic> _$PrinterInfoResultToJson(PrinterInfoResult instance) =>
    <String, dynamic>{
      'state_message': instance.stateMessage,
      'klipper_path': instance.klipperPath,
      'config_file': instance.configFile,
      'software_version': instance.softwareVersion,
      'hostname': instance.hostname,
      'cpu_info': instance.cpuInfo,
      'state': instance.state,
      'python_path': instance.pythonPath,
      'log_file': instance.logFile,
    };
