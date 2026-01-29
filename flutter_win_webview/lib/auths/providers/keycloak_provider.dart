import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/auths/storage_converters/auth_stae_keycloak_model_converter.dart';
import 'package:flutter_win_webview/auths/storage_converters/auth_state_model_converter.dart';
import 'package:flutter_win_webview/libexts/defaultresult.dart';
import 'package:flutter_win_webview/storeges/reader_writer.dart';
import 'package:http/http.dart' as http; // ★ 追加：トークン交換用

final class KeycloakProvider {
  final IAuthUriModel authUriModel;
  final ReaderWriter readerWriter;
  final HttpServer? callbackServer;

  bool isLoading = false;

  String? token;

  KeycloakProvider._({
    required this.callbackServer,
    required this.readerWriter,
    required this.authUriModel,
  }) {
    readerWriter.converters.addAll({
      (AuthStateModelConverter).toString(): AuthStateModelConverter(),
      (AuthStaeKeycloakModelConverter).toString():
          AuthStaeKeycloakModelConverter(),
    });
  }

  factory KeycloakProvider.create({
    required HttpServer server,
    required IAuthUriModel authUriModel,
    required ReaderWriter readWriter,
  }) {
    final provider = KeycloakProvider._(
      readerWriter: readWriter,
      authUriModel: authUriModel,
      callbackServer: server,
    );
    unawaited(provider.login()); // バックグラウンドで待ち受け
    return provider;
  }

  //
  Future<void> refreshToken() async {
    final result = await readerWriter.read<AuthStateModel>(AUTH_MODEL_KEY);
    final model = switch (result) {
      Success<AuthStateModel>() => result.value,
      Failure<AuthStateModel>() => null,
      Warning<AuthStateModel>() => throw UnimplementedError(),
    };

    if (model != null &&
        model.isAccessTokenExpired == ExpiredStateType.enabled) {
      await _post(PostType.token, model.code!);
    }
  }

  Future<void> logout() async {
    final result = await readerWriter.read<AuthStateModel>(AUTH_MODEL_KEY);
    final model = switch (result) {
      Success<AuthStateModel>() => result.value,
      _ => null,
    };

    if (model != null &&
        model.isAccessTokenExpired == ExpiredStateType.enabled) {
      await _post(PostType.logout, model.code!);
    }

    await readerWriter.delete(AUTH_MODEL_KEY);
  }

  // ★ 3) コールバックを受け取り、トークンへ交換
  Future<void> login() async {
    try {
      final req = await callbackServer!.firstWhere(
        (r) => r.uri.path == '/callback',
      );
      final uri = req.uri;

      // ユーザー向けに軽いHTMLを返答（真っ白回避）
      req.response.headers.contentType = ContentType.html;
      req.response.write(
        '<html><body>サインイン処理に戻っています。ウィンドウを閉じても構いません。</body></html>',
      );

      await req.response.close();
      await callbackServer?.close(force: true);

      final code = uri.queryParameters['code'];
      //final state = uri.queryParameters['state'];

      if (code == null || code.isEmpty) {
        log('No authorization code in callback.');
        return;
      }

      // ★ state の検証（KeycloakAccessModel が発行した値と一致するか）を必ず実装
      // if (state != expectedState) { ... return; }
      await _post(PostType.token, code);
    } catch (e, st) {
      log('Callback wait error: $e\n$st');
    }
  }

  Future<void> _post(PostType type, String code) async {
    try {
      final keycloakModel = authUriModel as KeycloakUriModel;
      final body = <String, String>{
        'grant_type': 'authorization_code',
        'client_id': keycloakModel.clientId,
        'code': code,
        'redirect_uri': keycloakModel.redirectUri,
        'code_verifier': keycloakModel.codeVerifier, // ★ PKCE
      };

      final postUri = switch (type) {
        PostType.logout => keycloakModel.logoutUrl,
        _ => keycloakModel.tokenUrl,
      };

      final res = await http.post(
        postUri,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: body,
      );

      final result = switch (type) {
        PostType.token =>
          res.statusCode == 200
              ? AuthStateKyclaokModel.fromResponse(code, res.body)
              : null,
        PostType.logout =>
          res.statusCode == 204
              ? AuthStateModel(accessToken: '', code: '')
              : null,
        _ => null,
      };

      if (result == null) {
        readerWriter.delete('auth');
      } else {
        readerWriter.write('auth', result);
      }

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
    callbackServer?.close(force: true);
  }
}

enum PostType { token, login, logout }
