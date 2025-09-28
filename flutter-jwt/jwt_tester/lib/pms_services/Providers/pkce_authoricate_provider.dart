import 'dart:async';
import 'dart:io';
import '../providers/post_provider.dart';
import '../extends/auth_event_factory.dart';
import '../models/events/auth_fail_event.dart';
import '../pkce_config.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/auth_state_model.dart';
import '../models/token_model.dart';
import '../url_config.dart';
import '../models/events/auth_event.dart';
import 'post_provider.dart' hide PostProvider;

class PkceAuthenticatorProver {
  final UrlConfig urlConfig;
  final PkceConfig pkceConfig;
  final AuthStateModel state;
  final StreamSink<AuthEvent>? authEventStream;
  final PostProvider postProvider;

  PkceAuthenticatorProver({
    required this.urlConfig,
    required this.pkceConfig,
    required this.state,
    this.authEventStream,
    required this.postProvider,
  });

  /// 認証開始（ログイン）
  Future<void> login({SecurityContext? context}) async {
    // 認証開始イベント（ログアウトにも使用可能）
    authEventStream?.add(AuthEventFactory.start(state));
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
    final addBodys={
        "grant_type":"authorization_code",
        "code":tokenResponse['code'],
        "redirect_uri":urlConfig.redirectUrl.query,
        "client_id":pkceConfig.clientId,
        "code_verifier":pkce.verifier,
      };

    final response=await postProvider.post(
      url: urlConfig.tokenUrl,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: Uri(queryParameters: addBodys).query,
      context: context,
    );

    switch(response.statusCode){
      case 200:
        // トークンモデル構築
        final token = TokenModel(
          accessToken: response['access_token'],
          refreshToken: response['refresh_token'],
          expiresAt: DateTime.now().add(Duration(seconds: tokenResponse['expires_in'])),
        );

        // 認証完了イベント
        authEventStream?.add(AuthEventFactory.complete(token, state));
        break;
      case 400:
        //認証失敗
        authEventStream?.add(AuthFailEvent(state));
        break;
    }
  }
}