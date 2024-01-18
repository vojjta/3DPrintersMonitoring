part of '../../../application/bloc/status/status_bloc.dart';

@immutable
abstract class StatusState {}

class StatusInitial extends StatusState {}

class StatusLoaded extends StatusState {

  final double bedTemp;
  final double nozzleTemp;

  StatusLoaded({required this.bedTemp, required this.nozzleTemp,});

}

class StatusLoadError extends StatusState {}
