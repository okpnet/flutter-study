// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_listenable.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(refreshListenable)
final refreshListenableProvider = RefreshListenableProvider._();

final class RefreshListenableProvider
    extends
        $FunctionalProvider<
          Raw<ValueNotifier<int>>,
          Raw<ValueNotifier<int>>,
          Raw<ValueNotifier<int>>
        >
    with $Provider<Raw<ValueNotifier<int>>> {
  RefreshListenableProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refreshListenableProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refreshListenableHash();

  @$internal
  @override
  $ProviderElement<Raw<ValueNotifier<int>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Raw<ValueNotifier<int>> create(Ref ref) {
    return refreshListenable(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<ValueNotifier<int>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<ValueNotifier<int>>>(value),
    );
  }
}

String _$refreshListenableHash() => r'c88573d2087b9acd96722c117edd9cff325e3fa1';
