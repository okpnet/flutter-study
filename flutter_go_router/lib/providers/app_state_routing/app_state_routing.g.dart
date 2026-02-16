// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_routing.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appStateRouting)
final appStateRoutingProvider = AppStateRoutingProvider._();

final class AppStateRoutingProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AppStateRoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStateRoutingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStateRoutingHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return appStateRouting(ref);
  }
}

String _$appStateRoutingHash() => r'81a98990b37fac0559b97b468ee526f1e4c2af80';
