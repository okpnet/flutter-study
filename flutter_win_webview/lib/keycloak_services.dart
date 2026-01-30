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
    delegate: (server) async {
      final req = await server.firstWhere((r) => r.uri.path == '/callback');
      final uri = req.uri;

      // ユーザー向けに軽いHTMLを返答（真っ白回避）
      req.response.headers.contentType = ContentType.html;
      req.response.write(
        '<html><body>サインイン処理に戻っています。ウィンドウを閉じても構いません。</body></html>',
      );

      await req.response.close();
      final code = uri.queryParameters['code'];
      return code;
    },
  );
});
