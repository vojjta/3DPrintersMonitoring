import 'package:printer_monitoring/domain/value/job_status.dart';

class JobModel extends JobStatus {
  JobModel(super.name, super.progress, super.eta);

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      json['name'],
      json['progress'],
      json['eta'],
    );
  }
}
