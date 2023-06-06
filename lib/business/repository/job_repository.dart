import 'package:printer_monitoring/business/entities/job.dart';

abstract class JobRepository{
  JobEntity getJob();
}