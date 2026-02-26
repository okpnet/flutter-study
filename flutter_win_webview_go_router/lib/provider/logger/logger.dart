import 'package:flutter_win_webview_go_router/services/logger/ilogger.dart';
import 'package:talker/talker.dart';

class Logger implements ILogger {
  final _logger = Talker();
  @override
  void critical(String? message, {Exception? ex, StackTrace? st}) =>
      _logger.critical(message, ex, st);

  @override
  void debug(String? message, {Exception? ex, StackTrace? st}) =>
      _logger.debug(message, ex, st);

  @override
  void error(String? message, {Exception? ex, StackTrace? st}) =>
      _logger.error(message, ex, st);

  @override
  void info(String? message, {Exception? ex, StackTrace? st}) =>
      _logger.info(message, ex, st);

  @override
  void warnig(String? message, {Exception? ex, StackTrace? st}) =>
      _logger.warning(message, ex, st);
}
