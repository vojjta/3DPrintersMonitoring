import 'package:json_annotation/json_annotation.dart';

part 'printer_info_result.g.dart';

@JsonSerializable()
class PrinterInfoResult {
  @JsonKey(name: 'state_message')
  final String stateMessage;
  @JsonKey(name: 'klipper_path')
  final String klipperPath;
  @JsonKey(name: 'config_file')
  final String configFile;
  @JsonKey(name: 'software_version')
  final String softwareVersion;
  final String hostname;
  @JsonKey(name: 'cpu_info')
  final String cpuInfo;
  final String state;
  @JsonKey(name: 'python_path')
  final String pythonPath;
  @JsonKey(name: 'log_file')
  final String logFile;

  PrinterInfoResult(
      {required this.stateMessage,
      required this.klipperPath,
      required this.configFile,
      required this.softwareVersion,
      required this.hostname,
      required this.cpuInfo,
      required this.state,
      required this.pythonPath,
      required this.logFile});

  factory PrinterInfoResult.fromJson(Map<String, dynamic> json) => _$PrinterInfoResultFromJson(json['result']);

  @override
  String toString() {
    return 'PrinterInfoResult{stateMessage: $stateMessage, klipperPath: $klipperPath, configFile: $configFile, softwareVersion: $softwareVersion, hostname: $hostname, cpuInfo: $cpuInfo, state: $state, pythonPath: $pythonPath, logFile: $logFile}';
  }
}
