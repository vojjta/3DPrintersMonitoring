import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

mixin L {
  Logger? _logger;

  @protected
  Logger get l => _logger ?? (_logger = _isTest ? Logger() : GetIt.I<Logger>());

  bool get _isTest => Platform.environment.containsKey('FLUTTER_TEST');
}
