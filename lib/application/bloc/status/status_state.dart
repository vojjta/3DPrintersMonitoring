part of './status_bloc.dart';

@immutable
sealed class StatusState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class StatusInitial extends StatusState {}

final class StatusLoadSuccess extends StatusState {
  final double bedTemp;
  final double nozzleTemp;

  StatusLoadSuccess({
    required this.bedTemp,
    required this.nozzleTemp,
  });

  @override
  List<Object?> get props => [bedTemp, nozzleTemp];
}

final class StatusLoadFailure extends StatusState {}
