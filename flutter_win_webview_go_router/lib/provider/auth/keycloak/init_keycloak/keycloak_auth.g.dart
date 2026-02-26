// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keycloak_auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(keycloakAuth)
final keycloakAuthProvider = KeycloakAuthProvider._();

final class KeycloakAuthProvider
    extends $FunctionalProvider<KeycloakServer, KeycloakServer, KeycloakServer>
    with $Provider<KeycloakServer> {
  KeycloakAuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keycloakAuthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keycloakAuthHash();

  @$internal
  @override
  $ProviderElement<KeycloakServer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  KeycloakServer create(Ref ref) {
    return keycloakAuth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KeycloakServer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KeycloakServer>(value),
    );
  }
}

String _$keycloakAuthHash() => r'8ae86fa9fa600ee93b3920c1afffbe2b04fd1eab';
