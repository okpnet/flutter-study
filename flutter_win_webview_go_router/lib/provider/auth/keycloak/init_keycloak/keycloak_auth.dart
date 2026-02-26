import 'dart:async';
import 'dart:io';

import 'package:flutter_win_webview_go_router/constants/constant_configure.dart';
import 'package:flutter_win_webview_go_router/provider/logger/logger.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/callback/callback_server.dart';
import 'package:flutter_win_webview_go_router/provider/auth/keycloak/model/keycloak_uri_model.dart';
import 'package:flutter_win_webview_go_router/provider/auth/keycloak/server/keycloak_server.dart';
import 'package:flutter_win_webview_go_router/services/storages/rider_writer/secure_storage_reader_writer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keycloak_auth.g.dart';

@riverpod
KeycloakServer keycloakAuth(Ref ref) {
  // ignore: no_leading_underscores_for_local_identifiers
  final _logger = Logger();
  final keycloak = KeycloakServer.create(
    ref: ref,
    authUriModel: ConstantConfigure.URI_MODEL,
    readWriter: SecureStorageReaderWriter(),
  );
  final serverAsync = ref.read(
    callBackServerProvider(port: ConstantConfigure.CALLBACK_SERVER_PORT),
  );

  serverAsync.whenData((server) {
    server.listen((HttpRequest request) {
      final uri = request.uri;

      // ユーザー向けに軽いHTMLを返答（真っ白回避）
      request.response.headers.contentType = ContentType.html;
      request.response.write(
        '<html><body>サインイン処理に戻っています。ウィンドウを閉じても構いません。</body></html>',
      );

      final code = uri.queryParameters['code'];
      unawaited(
        keycloak.login(code: code).whenComplete(() {
          _logger.debug('Callback server: login process completed.');
        }),
      );
    });
  });
  return keycloak;
}
