import 'dart:async';

import 'package:jwt_tester/pms_services/extends/auth_event_factory.dart';
import 'package:jwt_tester/pms_services/pkce_config.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/auth_state_model.dart';
import 'models/token_model.dart';
import 'url_config.dart';
import 'models/events/auth_event.dart';
class PkceAuthenticator {
  final UrlConfig urlConfig;
  final PkceConfig pkceConfig;
  final AuthStateModel state;
  final StreamSink<AuthEvent> authEventStream;

  PkceAuthenticator({
    required this.urlConfig,
    required this.pkceConfig,
    required this.state,
    required this.authEventStream,
  });

  /// 認証開始（ログイン）
  Future<void> login() async {
    // 認証開始イベント（ログアウトにも使用可能）
    authEventStream.add(AuthEventFactory.start(state));
    final pkce = state.pkce;

    // 認可サーバーの発見とクライアント構築
    final issuer = await Issuer.discover(urlConfig.authUrl);
    final client = Client(issuer, pkceConfig.clientId);

    // ブラウザ起動関数
    Future<void> launch(String url) async {
      if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    }

    // 認証フロー開始
    final authenticator = Authenticator(
      client,
      scopes: pkceConfig.scopes,
      redirectUri: urlConfig.redirectUrl,
      port: urlConfig.redirectUrl.port,
      urlLancher: launch,
      prompt: 'login',
      additionalParameters: {
        'code_challenge': pkce.challenge,
        'code_challenge_method': pkceConfig.challengeMethod,
      },
    );

    final credential = await authenticator.authorize();
    final tokenResponse = await credential.getTokenResponse();

    // トークンモデル構築
    final token = TokenModel(
      accessToken: tokenResponse['access_token'],
      refreshToken: tokenResponse['refresh_token'],
      expiresAt: DateTime.now().add(Duration(seconds: tokenResponse['expires_in'])),
    );

    // 認証完了イベント
    authEventStream.add(AuthEventFactory.complete(token, state));
  }
}