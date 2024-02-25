import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

mixin L {
  @protected
  Logger get l => _isTest ? Logger() : GetIt.I<Logger>();

  bool get _isTest => Platform.environment.containsKey('FLUTTER_TEST');
}
