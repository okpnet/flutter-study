// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Authentication)
final authenticationProvider = AuthenticationProvider._();

final class AuthenticationProvider
    extends $NotifierProvider<Authentication, AuthStateType> {
  AuthenticationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticationHash();

  @$internal
  @override
  Authentication create() => Authentication();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthStateType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthStateType>(value),
    );
  }
}

String _$authenticationHash() => r'61283540eeb6e4577ce759f6046bb0ecae10f855';

abstract class _$Authentication extends $Notifier<AuthStateType> {
  AuthStateType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AuthStateType, AuthStateType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthStateType, AuthStateType>,
              AuthStateType,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
