abstract interface class ILogger {
  void debug(String? message, {Exception? ex, StackTrace? st});
  void info(String? message, {Exception? ex, StackTrace? st});
  void error(String? message, {Exception? ex, StackTrace? st});
  void warnig(String? message, {Exception? ex, StackTrace? st});
  void critical(String? message, {Exception? ex, StackTrace? st});
}
