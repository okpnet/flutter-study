// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redirect_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(redirectController)
final redirectControllerProvider = RedirectControllerProvider._();

final class RedirectControllerProvider
    extends
        $FunctionalProvider<
          RedirectController,
          RedirectController,
          RedirectController
        >
    with $Provider<RedirectController> {
  RedirectControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'redirectControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$redirectControllerHash();

  @$internal
  @override
  $ProviderElement<RedirectController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RedirectController create(Ref ref) {
    return redirectController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RedirectController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RedirectController>(value),
    );
  }
}

String _$redirectControllerHash() =>
    r'897f62d8e9c7afab39a43f383a9f7f54ad5b3975';
