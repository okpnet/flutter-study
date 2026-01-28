//抽象化インターフェイス
abstract interface class StorageItemConverter {}

//コンバーターインターフェイス
abstract interface class StorageTypeConverter<T> extends StorageItemConverter {
  String convertToString(T item);
  T convertFromString(String data);
}

//文字列コンバーターの実装例
class StorageStringConverter implements StorageTypeConverter<String> {
  @override
  String convertToString(String item) {
    return item.toString();
  }

  @override
  String convertFromString(String data) {
    // Basic implementation; in real scenarios, more complex logic may be needed
    return data;
  }
}
