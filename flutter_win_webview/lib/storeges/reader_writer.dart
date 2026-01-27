import 'package:flutter_win_webview/libexts/defaultresult.dart';

abstract class ReaderWriter {
  dynamic [](String key);
  void []=(String key,dynamic value);
  Future<void> write<T>(String key, T value);
  Future<Result<T>> read<T>(String key);
}