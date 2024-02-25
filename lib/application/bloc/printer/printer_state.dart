part of './printer_bloc.dart';

@immutable
sealed class PrinterState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PrinterInitial extends PrinterState {}

final class PrinterLoadSuccess extends PrinterState {
  final String name;

  PrinterLoadSuccess({required this.name});

  @override
  List<Object?> get props => [name];
}

final class PrinterLoadFailure extends PrinterState {}
