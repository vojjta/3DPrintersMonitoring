part of 'add_printer_bloc.dart';

@immutable
abstract class AddPrinterEvent {}

final class AddPrinterCall extends AddPrinterEvent {
  final String name;
  final String address;
  final int port;

  AddPrinterCall({required this.name, required this.address, required this.port});
}
