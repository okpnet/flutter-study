import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/auths/providers/auth_providers.dart';
import 'package:flutter_win_webview/storeges/reader_writers.dart';

//接続モデル
final authUriModelProvider = Provider<IAuthUriModel>((ref) {
  final uriModel = KeycloakUriModel.generate(
    //keycloakUrl: 'https://qmspi.local:8443/',
    keycloakUrl: 'https://okp-04.local:8443',
    clientId: 'qual-app',
    realms: 'pms',
    redirectUri: 'http://127.0.0.1:45035/callback',
    scopes: ['openid', 'profile', 'email'],
  );
  return uriModel;
});
//ストレージ
final readerWriterProvider = Provider<IStorageReaderWriter>((ref) {
  return SecureStorageReaderWriter();
});

final authStateProvider = StateProvider<ExpiredStateEvent>((ref) {
  return ExpiredStateEvent(value: ExpiredStateType.signedOut);
});

final expriedHandlerProvider = Provider<ExpiredEventHandler>(
  (ref) => ExpiredEventHandler(ref),
);

//Keclaokを使ったOAuthサービスプロバイダ
final keycloakProvider = Provider<IAuthProvider>((ref) {
  final authUri = ref.watch(authUriModelProvider);
  final rw = ref.watch(readerWriterProvider);
  final handler = ref.watch(expriedHandlerProvider);

  final keycloakProvider = KeycloakProvider.create(
    authUriModel: authUri,
    readWriter: rw,
  );
  keycloakProvider.onChange.listen(handler.handle);

  return keycloakProvider;
});

class ExpiredEventHandler {
  ExpiredEventHandler(this.ref);

  final Ref ref;

  bool _enabled = true;

  void enable() => _enabled = true;
  void disable() => _enabled = false;

  @override
  void handle(ExpiredStateEvent event) {
    if (!_enabled) return;
    // 通常処理
    ref.read(authStateProvider.notifier).state = event;
  }
}
