import 'package:printer_monitoring/domain/entities/job_status.dart';

class JobModel extends JobStatusEntity {
  JobModel(super.name, super.progress, super.eta);

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      json['name'],
      json['progress'],
      json['eta'],
    );
  }
}
