part of './add_printer_bloc.dart';

@immutable
sealed class AddPrinterState {}

final class AddPrinterInitial extends AddPrinterState {}

final class AddPrinterSuccess extends AddPrinterState {}

final class AddPrinterFailure extends AddPrinterState {}
