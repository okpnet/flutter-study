import 'package:flutter_win_webview/libexts/defaultresult.dart';
import 'package:flutter_win_webview/storeges/storage_change_event.dart';
import 'package:flutter_win_webview/storeges/storage_item_converter.dart';

//読み書きインターフェイス
abstract interface class ReaderWriter {
  Map<String, StorageItemConverter> get converters;
  Stream<StorageChangeEvent> get onChange;
  dynamic operator [](String key);
  void operator []=(String key, dynamic value);
  Future<void> write<T>(String key, T value);
  Future<Result<T>> read<T>(String key);
  Future<void> delete(String key);
  Future<void> clear();
}
