import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/auths/providers/auth_providers.dart';
import 'package:flutter_win_webview/storeges/reader_writers.dart';

//接続モデル
final authUriModelProvider = Provider<IAuthUriModel>((ref) {
  final uriModel = KeycloakUriModel.generate(
    keycloakUrl: 'https://qmspi.local:8443/',
    //keycloakUrl: 'https://okp-04.local:8443',
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
//ローカルHTTPサーバ。ログインのときのみ使用する。
final callbackServerProvider = FutureProvider<HttpServer>((ref) async {
  return await HttpServer.bind(InternetAddress.loopbackIPv4, 45035);
});
//Keclaokを使ったOAuthサービスプロバイダ
final keycloakProvider = FutureProvider<IAuthProvider>((ref) async {
  final server = await ref.watch(callbackServerProvider.future);
  final authUri = ref.watch(authUriModelProvider);
  final rw = ref.watch(readerWriterProvider);

  return KeycloakProvider.create(
    server: server,
    authUriModel: authUri,
    readWriter: rw,
  );
});
