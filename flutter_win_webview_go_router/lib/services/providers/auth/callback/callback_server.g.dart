// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'callback_server.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(callBackServer)
final callBackServerProvider = CallBackServerFamily._();

final class CallBackServerProvider
    extends
        $FunctionalProvider<
          AsyncValue<HttpServer>,
          HttpServer,
          FutureOr<HttpServer>
        >
    with $FutureModifier<HttpServer>, $FutureProvider<HttpServer> {
  CallBackServerProvider._({
    required CallBackServerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'callBackServerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$callBackServerHash();

  @override
  String toString() {
    return r'callBackServerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<HttpServer> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HttpServer> create(Ref ref) {
    final argument = this.argument as int;
    return callBackServer(ref, port: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CallBackServerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$callBackServerHash() => r'bd05f2281d187f7db87ebe767a2a038209829dcc';

final class CallBackServerFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<HttpServer>, int> {
  CallBackServerFamily._()
    : super(
        retry: null,
        name: r'callBackServerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CallBackServerProvider call({required int port}) =>
      CallBackServerProvider._(argument: port, from: this);

  @override
  String toString() => r'callBackServerProvider';
}
