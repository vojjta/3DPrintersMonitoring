abstract class PrinterState {}

class InitialNoPrinter extends PrinterState {}

class PrinterLoaded extends PrinterState {
  final String name;

  PrinterLoaded({required this.name});
}

class PrinterLoadError extends PrinterState {}
