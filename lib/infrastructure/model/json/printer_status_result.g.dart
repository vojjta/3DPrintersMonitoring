// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_status_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrinterStatusResult _$PrinterStatusResultFromJson(Map<String, dynamic> json) =>
    PrinterStatusResult(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      eventTime: (json['eventtime'] as num).toDouble(),
    );

Map<String, dynamic> _$PrinterStatusResultToJson(
        PrinterStatusResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'eventtime': instance.eventTime,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      printStats:
          PrintStats.fromJson(json['print_stats'] as Map<String, dynamic>),
      heaterBed: HeaterBed.fromJson(json['heater_bed'] as Map<String, dynamic>),
      extruder: Extruder.fromJson(json['extruder'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'print_stats': instance.printStats,
      'heater_bed': instance.heaterBed,
      'extruder': instance.extruder,
    };

Extruder _$ExtruderFromJson(Map<String, dynamic> json) => Extruder(
      temperature: (json['temperature'] as num).toDouble(),
    );

Map<String, dynamic> _$ExtruderToJson(Extruder instance) => <String, dynamic>{
      'temperature': instance.temperature,
    };

HeaterBed _$HeaterBedFromJson(Map<String, dynamic> json) => HeaterBed(
      temperature: (json['temperature'] as num).toDouble(),
    );

Map<String, dynamic> _$HeaterBedToJson(HeaterBed instance) => <String, dynamic>{
      'temperature': instance.temperature,
    };

PrintStats _$PrintStatsFromJson(Map<String, dynamic> json) => PrintStats(
      state: json['state'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$PrintStatsToJson(PrintStats instance) =>
    <String, dynamic>{
      'state': instance.state,
      'message': instance.message,
    };
