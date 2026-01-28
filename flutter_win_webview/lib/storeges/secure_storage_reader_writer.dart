import 'dart:async';
import 'package:flutter_win_webview/libexts/defaultresult.dart';
import 'package:flutter_win_webview/storeges/reader_writer.dart';
import 'package:flutter_win_webview/storeges/storage_item_converter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//ストレージ読み書き
class SecureStorageReaderWriter implements ReaderWriter {
  //コンバーター群
  //キーは型名
  final Map<String, StorageItemConverter> _converters = {
    (String).toString(): StorageStringConverter(),
  };
  //ストレージライブラリインスタンス
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  //コンバーター群ゲットアクセサ
  @override
  Map<String, StorageItemConverter> get converters => _converters;
  //コンストラクタ
  SecureStorageReaderWriter();
  //キーでストレージにアクセス
  @override
  dynamic operator [](String key) {
    // Implementation for reading from secure storage
    dynamic result;
    unawaited(
      () async {
            result = await read(key);
          }
          as Future<void>?,
    );
    return result;
  }

  //キーでストレージにアクセス
  @override
  void operator []=(String key, dynamic value) {
    // Implementation for writing to secure storage
    unawaited(write(key, value));
  }

  //書き込み:T型用のコンバーターが存在しないときは例外をスロー
  @override
  Future<void> write<T>(String key, T value) async {
    // Implementation for writing to secure storage
    final converterKey = (T).toString();
    final converter = _converters[converterKey];
    if (converter == null) {
      throw Exception("No converter found for type $converterKey");
    }
    final data = (converter as StorageTypeConverter<T>).convertToString(value);
    await _storage.write(key: key, value: data);
  }

  //読み込み:T型用のコンバーターが存在しないときは例外をスロー
  @override
  Future<Result<T>> read<T>(String key) async {
    // Implementation for reading from secure storage
    final converterKey = (T).toString();
    final converter = _converters[converterKey];
    if (converter == null) {
      return Result.failure(
        Exception("No converter found for type $converterKey"),
      );
    }
    final data = await _storage.read(key: key);
    if (data == null) {
      return Result.failure(Exception("No data found for key $key"));
    }
    final converted = (converter as StorageTypeConverter<T>).convertFromString(
      data,
    );
    return Result.success(converted);
  }

  //ストレージからキーのアイテムを削除
  @override
  Future<void> delete(String key) async {
    // Implementation for deleting from secure storage
    await _storage.delete(key: key);
  }

  //ストレージを空にする
  @override
  Future<void> clear() async {
    // Implementation for clearing all data in secure storage
    await _storage.deleteAll();
  }
}
