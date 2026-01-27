import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_win_webview/auths/auth_uri_model.dart';
import 'package:flutter_win_webview/auths/keycloak_uri_model.dart';
import 'package:http/http.dart' as http; // ★ 追加：トークン交換用
import 'package:get_it/get_it.dart';

final class KeycloakProvider {
  final AuthUriModel authUriModel;

  HttpServer? _server;

  bool isLoading = false;

  String? token;

  KeycloakProvider._(HttpServer server, {required this.authUriModel}) {
    _server = server;
  }

  factory KeycloakProvider.create({
    required HttpServer server,
    required AuthUriModel authUriModel,
  }) {
    final provider = KeycloakProvider._(server, authUriModel: authUriModel);
    unawaited(provider._waitForCallback()); // バックグラウンドで待ち受け
    return provider;
  }

  // ★ 3) コールバックを受け取り、トークンへ交換
  Future<void> _waitForCallback() async {
    try {
      final req = await _server!.firstWhere((r) => r.uri.path == '/callback');
      final uri = req.uri;

      // ユーザー向けに軽いHTMLを返答（真っ白回避）
      req.response.headers.contentType = ContentType.html;
      req.response.write(
        '<html><body>サインイン処理に戻っています。ウィンドウを閉じても構いません。</body></html>',
      );

      await req.response.close();
      await _server?.close(force: true);

      final code = uri.queryParameters['code'];
      final state = uri.queryParameters['state'];

      if (code == null || code.isEmpty) {
        log('No authorization code in callback.');
        return;
      }
      // ★ state の検証（KeycloakAccessModel が発行した値と一致するか）を必ず実装
      // if (state != expectedState) { ... return; }
      await _exchangeToken(code);
    } catch (e, st) {
      log('Callback wait error: $e\n$st');
    }
  }

  Future<void> _exchangeToken(String code) async {
    try {
      final _keycloakModel = authUriModel as KeycloakUriModel;
      final body = <String, String>{
        'grant_type': 'authorization_code',
        'client_id': _keycloakModel!.clientId,
        'code': code,
        'redirect_uri': _keycloakModel!.redirectUri,
        'code_verifier': _keycloakModel!.codeVerifier, // ★ PKCE
      };

      final res = await http.post(
        _keycloakModel!.tokenUrl,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: body,
      );

      if (res.statusCode == 200) {
        final map = json.decode(res.body) as Map<String, dynamic>;
        final accessToken = map['access_token'] as String?;
        final idToken = map['id_token'] as String?;
        final refreshToken = map['refresh_token'] as String?;
        log('access_token: ${accessToken?.substring(0, 20)}...');
        log('id_token: ${idToken != null ? idToken.substring(0, 20) : '-'}...');
        log(
          'refresh_token: ${refreshToken != null ? refreshToken.substring(0, 20) : '-'}...',
        );

        // TODO: トークンの安全な保管＆画面遷移
      } else {
        log('Token exchange failed: ${res.statusCode} ${res.body}');
      }
    } catch (e, st) {
      log('Token exchange error: $e\n$st');
    }
  }

  void dispose() {
    _server?.close(force: true);
  }
}
