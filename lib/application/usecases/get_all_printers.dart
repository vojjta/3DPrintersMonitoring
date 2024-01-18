import 'dart:developer';

import 'package:printer_monitoring/application/data_status.dart';
import 'package:printer_monitoring/application/dto/printer_info.dart';
import 'package:printer_monitoring/application/exceptions/get_all_machines_exception.dart';
import 'package:printer_monitoring/application/mappers/printer_mapper.dart';
import 'package:printer_monitoring/application/use_case.dart';
import 'package:printer_monitoring/domain/entities/machine.dart';
import 'package:printer_monitoring/domain/repositories/storage_repository.dart';

final class GetAllPrinters extends UseCase<List<PrinterInfo>, void> {
  final StorageRepository _storageRepository;

  GetAllPrinters(this._storageRepository);

  @override
  Future<DataStatus<List<PrinterInfo>>> templateCall(void params) async {
    log('Trying to get all machines');
    final List<Machine> machines = await _storageRepository.getAllMachines();
    if (machines.isNotEmpty) {
      return Future.value(DataSuccess(machines.map((m) => PrinterMapper.toPrinterInfo(m)).toList()));
    }

    throw GetAllMachinesException('No machines found');
  }
}
