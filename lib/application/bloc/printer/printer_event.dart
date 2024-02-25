part of 'printer_bloc.dart';

@immutable
sealed class PrinterEvent {}

final class PrinterStarted extends PrinterEvent {}
