part of '../../../application/bloc/printer/printer_bloc.dart';

@immutable
abstract class PrinterState {}

class InitialNoPrinter extends PrinterState {}

class PrinterLoaded extends PrinterState {
  final PrinterInfo printer;

  PrinterLoaded(this.printer);
}

class PrinterLoadError extends PrinterState {}
