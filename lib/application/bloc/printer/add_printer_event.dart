part of './add_printer_bloc.dart';

@immutable
sealed class AddPrinterEvent extends Equatable {}

final class AddPrinterPressed extends AddPrinterEvent {
  final String name;
  final String address;
  final int port;

  AddPrinterPressed({required this.name, required this.address, required this.port});

  @override
  List<Object?> get props => [name, address, port];
}
