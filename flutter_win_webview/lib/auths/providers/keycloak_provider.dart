import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/auths/providers/expired_state_event.dart';
import 'package:flutter_win_webview/auths/providers/iauth_provider.dart';
import 'package:flutter_win_webview/auths/providers/web_auth_mixin.dart';
import 'package:flutter_win_webview/auths/results/connect_state_result.dart';
import 'package:flutter_win_webview/auths/storage_converters/auth_stae_keycloak_model_converter.dart';
import 'package:flutter_win_webview/auths/storage_converters/auth_state_model_converter.dart';
import 'package:flutter_win_webview/libexts/defaultresult.dart';
import 'package:flutter_win_webview/storeges/istorage_reader_writer.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart'; // ★ 追加：トークン交換用

//ローカルサーバーがコールバックを受け取るOAuth
final class KeycloakProvider with WebAuthMixin implements IAuthProvider {
  final IStorageReaderWriter readerWriter;
  final IAuthUriModel authUriModel;
  // ★ 追加：変更通知用の StreamController
  final _changeController = StreamController<ExpiredStateEvent>.broadcast();
  String? token;

  Future<void>? _inFlight;
  // ★ 外部が listen できるストリーム
  @override
  Stream<ExpiredStateEvent> get onChange => _changeController.stream;
  @override
  IAuthUriModel get uriModel => authUriModel;

  bool _isPosting = false;

  //コンストラクタ
  KeycloakProvider._({required this.readerWriter, required this.authUriModel}) {
    readerWriter.converters.addAll({
      (AuthStateModel).toString(): AuthStateModelConverter(),
      (AuthStateKyclaokModel).toString(): AuthStaeKeycloakModelConverter(),
    });
  }
  //インスタンス生成
  factory KeycloakProvider.create({
    required IAuthUriModel authUriModel,
    required IStorageReaderWriter readWriter,
  }) {
    final provider = KeycloakProvider._(
      readerWriter: readWriter,
      authUriModel: authUriModel,
    );
    return provider;
  }
  //トークンの更新
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
  Future<void> login(String? code) async {
    try {
      if (code == null || code.isEmpty) {
        log('No authorization code in callback.');
        return;
      }

      await _post(PostType.token, code);
    } catch (e, st) {
      log('Callback wait error: $e\n$st');
    }
  }

  //ログイン後のコードがある状態のポスト通信
  Future<void> _post(PostType type, String code) async {
    final postFuture = () async {
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
          PostType.token => _getToken(code, res),
          PostType.logout => _getLogout(code, res),
          _ => ConnectStateResult.failure(Exception('Unknown post type')),
        };

        if (result is SuccessState<AuthStateModel> &&
            _changeController.isClosed == false) {
          final value = result.value;
          readerWriter.write(AUTH_MODEL_KEY, value);
          _changeController.add(
            ExpiredStateEvent(
              value: value.accessToken == null || value.accessToken!.isEmpty
                  ? ExpiredStateType.signedOut
                  : value.isAccessTokenExpired,
            ),
          );
        } else {
          //ここにくる場合はエラーハンドリング
          if (result is FailureState<AuthStateModel>) {
            final error = result;
            log('Error in _post: ${error.error}', level: 0, error: error.error);
          }
        }
      } catch (e, st) {
        log('Token exchange error: $e\n$st');
      } finally {
        _inFlight = null;
      }
    }();
    _inFlight = postFuture;
    await postFuture;
  }

  ConnectStateResult<AuthStateModel> _getToken(String code, Response res) =>
      res.statusCode == 200
      ? ConnectStateResult.success(
          AuthStateKyclaokModel.fromResponse(code, res.body),
          statusCode: res.statusCode,
        )
      : ConnectStateResult.failure(
          Exception('Failed to get token: ${res.statusCode}'),
          statusCode: res.statusCode,
        );

  ConnectStateResult<AuthStateModel> _getLogout(String code, Response res) =>
      res.statusCode == 204 || res.statusCode == 200
      ? ConnectStateResult.success(
          AuthStateModel(accessToken: null, code: null),
          statusCode: res.statusCode,
        )
      : ConnectStateResult.failure(
          Exception('Failed to get token: ${res.statusCode}'),
          statusCode: res.statusCode,
        );

  Future<void> dispose() async {
    //callbackServer?.close(force: true);
    try {
      for (int counter = 0; counter < 1000; counter++) {
        await Future.delayed(const Duration(milliseconds: 120));
        if (_inFlight == null) break;
      }
      log('KeycloakProvider post completed or timed out.');
    } catch (e) {
      log('Error waiting for in-flight post to complete: $e');
    } finally {
      _changeController.close();
      log('KeycloakProvider disposed');
    }
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
