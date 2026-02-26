import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_win_webview_go_router/constants/constant_duration.dart';
import 'package:flutter_win_webview_go_router/constants/errors/error.dart';
import 'package:flutter_win_webview_go_router/provider/auth/keycloak/model/auth_state_kyclaok_model.dart';
import 'package:flutter_win_webview_go_router/provider/auth/keycloak/model/keycloak_uri_model.dart';
import 'package:flutter_win_webview_go_router/services/options/connect_state_result.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/auth_model/authentication_model.dart';
import 'package:http/http.dart' as http;

/// POST通信の種類
enum PostType { token, login, logout }

/// HTTP通信を専門的に担当するクラス
class KeycloakHttpClient {
  final KeycloakUriModel uriModel;

  KeycloakHttpClient({required this.uriModel});

  /// POST通信を実行
  Future<ConnectStateResult<AuthenticationModel>> post(
    PostType type,
    String code,
  ) async {
    try {
      if (code.isEmpty) throw Exception('code is empty');

      final body = _buildRequestBody(code);
      final postUri = _getPostUri(type);

      // 自己証明書エラー可否
      HttpOverrides.global = PermitInvalidCertification();
      final res = await http
          .post(
            postUri,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: body,
          )
          .timeout(
            ConstantDuration.networkTimeout,
            onTimeout: () {
              throw NetworkTimeoutException();
            },
          );

      return _handleResponse(type, code, res);
    } catch (ex) {
      log('Token exchange error: $ex');
      return ConnectStateResult.failure(ex as Exception);
    }
  }

  /// リクエストボディを構築
  Map<String, String> _buildRequestBody(String code) {
    return <String, String>{
      'grant_type': 'authorization_code',
      'client_id': uriModel.clientId,
      'code': code,
      'redirect_uri': uriModel.redirectUri,
      'code_verifier': uriModel.codeVerifier, // ★ PKCE
    };
  }

  /// POST先URIを取得
  Uri _getPostUri(PostType type) {
    return switch (type) {
      PostType.logout => uriModel.logoutUrl,
      _ => uriModel.tokenUrl,
    };
  }

  /// レスポンスを処理
  ConnectStateResult<AuthenticationModel> _handleResponse(
    PostType type,
    String code,
    http.Response res,
  ) {
    return switch (type) {
      PostType.token => _handleTokenResponse(code, res),
      PostType.logout => _handleLogoutResponse(res),
      _ => ConnectStateResult<AuthenticationModel>.failure(
        Exception('Unknown post type'),
      ),
    };
  }

  /// トークンレスポンスを処理
  ConnectStateResult<AuthenticationModel> _handleTokenResponse(
    String code,
    http.Response res,
  ) => res.statusCode == 200
      ? ConnectStateResult.success(
          AuthStateKyclaokModel.fromResponse(code, res.body),
          statusCode: res.statusCode,
        )
      : ConnectStateResult.failure(
          Exception('Failed to get token: ${res.statusCode}'),
          statusCode: res.statusCode,
        );

  /// ログアウトレスポンスを処理
  ConnectStateResult<AuthenticationModel> _handleLogoutResponse(
    http.Response res,
  ) => res.statusCode == 204 || res.statusCode == 200
      ? ConnectStateResult.success(
          AuthenticationModel(accessToken: null, code: null),
          statusCode: res.statusCode,
        )
      : ConnectStateResult.failure(
          Exception('Failed to logout: ${res.statusCode}'),
          statusCode: res.statusCode,
        );
}

/// 自己証明書エラーを許可するHTTPクライアント
class PermitInvalidCertification extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
