part of 'add_printer_bloc.dart';

@immutable
abstract class AddPrinterState {}

class AddPrinterInitial extends AddPrinterState {}

class AddPrinterSuccess extends AddPrinterState {}

class AddPrinterError extends AddPrinterState {}
