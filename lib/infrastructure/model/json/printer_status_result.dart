import 'package:json_annotation/json_annotation.dart';

part 'printer_status_result.g.dart';

@JsonSerializable()
final class PrinterStatusResult {
  final Status status;

  @JsonKey(name: 'eventtime')
  final double eventTime;

  PrinterStatusResult({required this.status, required this.eventTime});

  factory PrinterStatusResult.fromJson(Map<String, dynamic> json) => _$PrinterStatusResultFromJson(json['result']);

  @override
  String toString() {
    return 'PrinterStatusResult{$status, eventTime: $eventTime}';
  }
}

@JsonSerializable()
final class Status {
  @JsonKey(name: 'print_stats')
  final PrintStats printStats;

  @JsonKey(name: 'heater_bed')
  final HeaterBed heaterBed;

  final Extruder extruder;

  Status({required this.printStats, required this.heaterBed, required this.extruder});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  @override
  String toString() {
    return 'Status{printStats: $printStats, $heaterBed, $extruder}';
  }
}

@JsonSerializable()
final class Extruder {
  final double temperature;

  Extruder({required this.temperature});

  factory Extruder.fromJson(Map<String, dynamic> json) => _$ExtruderFromJson(json);

  @override
  String toString() {
    return 'Extruder{temperature: $temperature}';
  }
}

@JsonSerializable()
final class HeaterBed {
  final double temperature;

  HeaterBed({required this.temperature});

  factory HeaterBed.fromJson(Map<String, dynamic> json) => _$HeaterBedFromJson(json);

  @override
  String toString() {
    return 'HeaterBed{temperature: $temperature}';
  }
}

@JsonSerializable()
final class PrintStats {
  final String state;
  final String message;

  PrintStats({required this.state, required this.message});

  factory PrintStats.fromJson(Map<String, dynamic> json) => _$PrintStatsFromJson(json);

  @override
  String toString() {
    return 'PrintStats{state: $state, message: $message}';
  }
}
