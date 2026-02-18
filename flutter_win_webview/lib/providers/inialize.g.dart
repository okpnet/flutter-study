// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inialize.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initializeHash() => r'2bb965db756ffc46120707f0612c11bfb785b3e7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [initialize].
@ProviderFor(initialize)
const initializeProvider = InitializeFamily();

/// See also [initialize].
class InitializeFamily extends Family<AsyncValue<void>> {
  /// See also [initialize].
  const InitializeFamily();

  /// See also [initialize].
  InitializeProvider call(int port) {
    return InitializeProvider(port);
  }

  @override
  InitializeProvider getProviderOverride(
    covariant InitializeProvider provider,
  ) {
    return call(provider.port);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'initializeProvider';
}

/// See also [initialize].
class InitializeProvider extends FutureProvider<void> {
  /// See also [initialize].
  InitializeProvider(int port)
    : this._internal(
        (ref) => initialize(ref as InitializeRef, port),
        from: initializeProvider,
        name: r'initializeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$initializeHash,
        dependencies: InitializeFamily._dependencies,
        allTransitiveDependencies: InitializeFamily._allTransitiveDependencies,
        port: port,
      );

  InitializeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.port,
  }) : super.internal();

  final int port;

  @override
  Override overrideWith(
    FutureOr<void> Function(InitializeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InitializeProvider._internal(
        (ref) => create(ref as InitializeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        port: port,
      ),
    );
  }

  @override
  FutureProviderElement<void> createElement() {
    return _InitializeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InitializeProvider && other.port == port;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, port.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InitializeRef on FutureProviderRef<void> {
  /// The parameter `port` of this provider.
  int get port;
}

class _InitializeProviderElement extends FutureProviderElement<void>
    with InitializeRef {
  _InitializeProviderElement(super.provider);

  @override
  int get port => (origin as InitializeProvider).port;
}

String _$authUriModelHash() => r'e44bd172bbab8467d000a9f55d754d178d1c3910';

/// 接続モデル（Keycloak の URI 構成）
///
/// Copied from [authUriModel].
@ProviderFor(authUriModel)
final authUriModelProvider = Provider<IAuthUriModel>.internal(
  authUriModel,
  name: r'authUriModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authUriModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthUriModelRef = ProviderRef<IAuthUriModel>;
String _$readerWriterHash() => r'316f6a02a2157832c94fbaa3994c9f52e8f955a9';

/// ストレージ（SecureStorage）
///
/// Copied from [readerWriter].
@ProviderFor(readerWriter)
final readerWriterProvider = AutoDisposeProvider<IStorageReaderWriter>.internal(
  readerWriter,
  name: r'readerWriterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$readerWriterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReaderWriterRef = AutoDisposeProviderRef<IStorageReaderWriter>;
String _$expiredHandlerHash() => r'469451888fcbfe05ce07fd7ceada81db7eef6ace';

/// 期限切れイベントのハンドラ
///
/// Copied from [expiredHandler].
@ProviderFor(expiredHandler)
final expiredHandlerProvider =
    AutoDisposeProvider<ExpiredEventHandler>.internal(
      expiredHandler,
      name: r'expiredHandlerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$expiredHandlerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExpiredHandlerRef = AutoDisposeProviderRef<ExpiredEventHandler>;
String _$keycloakHash() => r'7216343174d5eda2038ac5a11496ecdbf494dcdf';

/// Keycloak を使った OAuth サービスプロバイダ
///
/// Copied from [keycloak].
@ProviderFor(keycloak)
final keycloakProvider = AutoDisposeProvider<IAuthProvider>.internal(
  keycloak,
  name: r'keycloakProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$keycloakHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef KeycloakRef = AutoDisposeProviderRef<IAuthProvider>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
