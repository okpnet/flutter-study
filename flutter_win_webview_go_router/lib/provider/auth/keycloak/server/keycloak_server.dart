import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview_go_router/constants/errors/error.dart';
import 'package:flutter_win_webview_go_router/provider/auth/keycloak/converter/authentication_model_converter.dart';
import 'package:flutter_win_webview_go_router/provider/auth/keycloak/model/keycloak_uri_model.dart';
import 'package:flutter_win_webview_go_router/provider/auth/keycloak/server/keycloak_auth_state_handler.dart';
import 'package:flutter_win_webview_go_router/provider/auth/keycloak/server/keycloak_http_client.dart';
import 'package:flutter_win_webview_go_router/provider/logger/logger.dart';
import 'package:flutter_win_webview_go_router/services/options/connect_state_result.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/auth_model/authentication_model.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/auth_model/iauth_uri_model.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/auth_server/iauth_server.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/authenticate/authentication.dart';
import 'package:flutter_win_webview_go_router/services/storages/rider_writer/istorage_reader_writer.dart';

// 定数定義は keycloak_auth_state_handler.dart に移動

final class KeycloakServer implements IAuthServer {
  final IAuthUriModel authUriModel;
  final IStorageReaderWriter readerWriter;
  final String key = UniqueKey().toString();
  final Ref ref;
  final _logger = Logger();

  // 責務分割: HTTP通信とストレージ管理
  late final KeycloakHttpClient _httpClient;
  late final KeycloakAuthStateHandler _authStateHandler;

  KeycloakUriModel get uriModel => authUriModel as KeycloakUriModel;

  // コンストラクタ
  KeycloakServer._({
    required this.ref,
    required this.readerWriter,
    required this.authUriModel,
  }) {
    readerWriter.converters.addAll({
      (AuthenticationModel).toString(): AuthenticationModelConverter(),
    });
    _httpClient = KeycloakHttpClient(uriModel: uriModel);
    _authStateHandler = KeycloakAuthStateHandler(readerWriter: readerWriter);
  }

  // インスタンス生成
  factory KeycloakServer.create({
    required Ref ref,
    required IAuthUriModel authUriModel,
    required IStorageReaderWriter readWriter,
  }) {
    final provider = KeycloakServer._(
      ref: ref,
      readerWriter: readWriter,
      authUriModel: authUriModel,
    );
    return provider;
  }
  // トークンの更新
  @override
  Future<void> refreshToken() async {
    final model = await _authStateHandler.getStoredAuthModel();

    if (model != null && _authStateHandler.isTokenExpired(model)) {
      final result = await _httpClient.post(PostType.token, model.code!);
      switch (result) {
        case SuccessState<AuthenticationModel>():
          await _authStateHandler.saveAuthModel(result.value);
          break;
        case FailureState<AuthenticationModel>():
          _logger.warnig('refresh token error', ex: result.error);
          _error(result.error);
          break;
      }
    }
  }

  // ログアウト: ポストで送信
  @override
  Future<void> logout() async {
    final model = await _authStateHandler.getStoredAuthModel();

    if (model != null && _authStateHandler.isTokenExpired(model)) {
      final result = await _httpClient.post(PostType.logout, model.code!);
      switch (result) {
        case SuccessState<AuthenticationModel>():
          ref.read(authenticationProvider.notifier).changeSignout();
          break;
        case FailureState<AuthenticationModel>():
          _logger.warnig('signout error', ex: result.error);
          _error(result.error);
          break;
      }
    }
    await _authStateHandler.clearAuthState();
  }

  // ログイン: ローカルサーバのコールバック
  @override
  Future<void> login({String? code}) async {
    try {
      if (code == null || code.isEmpty) {
        _logger.error('No authorization code in callback.');
        return;
      }

      final result = await _httpClient.post(PostType.token, code);
      switch (result) {
        case SuccessState<AuthenticationModel>():
          ref.read(authenticationProvider.notifier).changeSignIn();
          _logger.debug('login');
          break;
        case FailureState<AuthenticationModel>():
          _logger.warnig('signin error', ex: result.error);
          _error(result.error);
          break;
      }
    } catch (e, st) {
      _logger.critical('Callback wait error', ex: e as Exception, st: st);
    }
  }

  Future<void> dispose() async {
    // callbackServer?.close(force: true);
    try {
      for (int counter = 0; counter < 1000; counter++) {
        await Future.delayed(const Duration(milliseconds: 120));
      }
      _logger.debug('KeycloakProvider post completed or timed out.');
    } catch (e, st) {
      _logger.critical(
        'Error waiting for in-flight post to complete',
        ex: e as Exception,
        st: st,
      );
    } finally {
      _logger.debug('KeycloakProvider disposed');
    }
  }

  void _error(Exception ex) {
    switch (ex) {
      case NetworkTimeoutException():
        ref.read(authenticationProvider.notifier).networkError();
        break;
      default:
        return;
    }
  }
}
