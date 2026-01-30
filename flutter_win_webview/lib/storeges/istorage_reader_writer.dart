import 'package:flutter_win_webview/libexts/defaultresult.dart';
import 'package:flutter_win_webview/storeges/storage_change_event.dart';
import 'package:flutter_win_webview/storeges/storage_item_converter.dart';

//読み込みインターフェイス
abstract interface class IStorageReader {
  Map<String, StorageItemConverter> get converters;
  Stream<StorageChangeEvent> get onChange;
  dynamic operator [](String key);
  Future<Result<T>> read<T>(String key);
}

//読み書きインターフェイス
abstract interface class IStorageReaderWriter extends IStorageReader {
  void operator []=(String key, dynamic value);
  Future<void> write<T>(String key, T value);
  Future<void> delete(String key);
  Future<void> clear();
}
