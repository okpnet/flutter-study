final class StorageChangeEvent {
  final Object? sender;
  final String key;

  StorageChangeEvent({required this.key, required this.sender});
}
