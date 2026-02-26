// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initialize.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(initilalize)
final initilalizeProvider = InitilalizeProvider._();

final class InitilalizeProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  InitilalizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initilalizeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initilalizeHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return initilalize(ref);
  }
}

String _$initilalizeHash() => r'2e1893673ea0a3b64b6eb402034a3b8dfd0c7156';
