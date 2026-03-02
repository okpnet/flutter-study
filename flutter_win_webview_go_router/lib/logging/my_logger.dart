import 'package:pms_authenticator/auth_controller.dart';
import 'package:talker/talker.dart';

class MyLogger implements ILogger {
  final Talker _talker = Talker();

  @override
  void critical(String? message, {Object? exception, StackTrace? stackTrace}) {
    _talker.critical(message ?? '', exception, stackTrace);
  }

  @override
  void debug(String? message, {Object? exception, StackTrace? stackTrace}) {
    _talker.debug(message ?? '', exception, stackTrace);
  }

  @override
  void error(String? message, {Object? exception, StackTrace? stackTrace}) {
    _talker.error(message ?? '', exception, stackTrace);
  }

  @override
  void info(String? message, {Object? exception, StackTrace? stackTrace}) {
    _talker.info(message ?? '', exception, stackTrace);
  }

  @override
  void warning(String? message, {Object? exception, StackTrace? stackTrace}) {
    _talker.warning(message ?? '', exception, stackTrace);
  }
}
