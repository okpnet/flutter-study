import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/auths/providers/expired_state_event.dart';
import 'package:flutter_win_webview/auths/providers/iauth_provider.dart';
import 'package:flutter_win_webview/auths/providers/web_auth_mixin.dart';
import 'package:flutter_win_webview/auths/storage_converters/auth_stae_keycloak_model_converter.dart';
import 'package:flutter_win_webview/auths/storage_converters/auth_state_model_converter.dart';
import 'package:flutter_win_webview/libexts/defaultresult.dart';
import 'package:flutter_win_webview/storeges/istorage_reader_writer.dart';
import 'package:http/http.dart' as http; // ★ 追加：トークン交換用

final class KeycloakProvider with WebAuthMixin implements IAuthProvider {
  final IStorageReaderWriter readerWriter;
  final HttpServer? callbackServer;
  // ★ 追加：変更通知用の StreamController
  final _changeController = StreamController<ExpiredStateEvent>.broadcast();

  bool isLoading = false;

  String? token;

  // ★ 外部が listen できるストリーム
  @override
  Stream<ExpiredStateEvent> get onChange => _changeController.stream;

  KeycloakProvider._({
    required this.callbackServer,
    required this.readerWriter,
    required uriModel,
  }) {
    readerWriter.converters.addAll({
      (AuthStateModelConverter).toString(): AuthStateModelConverter(),
      (AuthStaeKeycloakModelConverter).toString():
          AuthStaeKeycloakModelConverter(),
    });
    authUriModel = uriModel;
  }

  factory KeycloakProvider.create({
    required HttpServer server,
    required IAuthUriModel authUriModel,
    required IStorageReaderWriter readWriter,
  }) {
    final provider = KeycloakProvider._(
      readerWriter: readWriter,
      uriModel: authUriModel,
      callbackServer: server,
    );
    unawaited(provider.login()); // バックグラウンドで待ち受け
    return provider;
  }
  //
  @override
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

  //ログアウト:ポストで送信
  @override
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

  // ログイン:ローカルサーバのコールバック
  @override
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

  //ログイン後のコードがある状態のポスト通信
  Future<void> _post(PostType type, String code) async {
    try {
      if (code.isEmpty) throw Exception('code is empty');

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
      //自己証明書エラー可否
      HttpOverrides.global = PermitInvalidCertification();
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
        readerWriter.delete(AUTH_MODEL_KEY);
      } else {
        readerWriter.write(AUTH_MODEL_KEY, result);
      }
      _changeController.add(
        ExpiredStateEvent(
          value: result == null
              ? ExpiredStateType.signedOut
              : result.isAccessTokenExpired,
        ),
      );
    } catch (e, st) {
      log('Token exchange error: $e\n$st');
    }
  }

  void dispose() {
    callbackServer?.close(force: true);
    _changeController.close();
  }
}

class PermitInvalidCertification extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

enum PostType { token, login, logout }
