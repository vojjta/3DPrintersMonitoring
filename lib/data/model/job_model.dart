
import 'package:printer_monitoring/business/entities/job.dart';

class JobModel extends JobEntity{
  JobModel(super.name, super.progress, super.eta);
  
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      json['name'],
      json['progress'],
      json['eta'],
    );
  }
}