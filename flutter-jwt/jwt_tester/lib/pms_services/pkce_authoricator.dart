import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/auth_state_model.dart';
import 'models/token_model.dart';
import 'url_config.dart';
import 'models/events/auth_start_event.dart';
import 'models/events/auth_complete_event.dart';

class PkceAuthenticator {
  final UrlConfig config;
  final AuthStateModel state;

  PkceAuthenticator({
    required this.config,
    required this.state,
  });

  /// 認証開始（ログイン）
  Future<void> login() async {
    // 認証開始イベント（ログアウトにも使用可能）
    state.applyEvent(AuthStartEvent());

    final pkce = state.pkce;

    // 認可サーバーの発見とクライアント構築
    final issuer = await Issuer.discover(config.authUrl);
    final client = Client(issuer, 'qual-app');

    // ブラウザ起動関数
    Future<void> launch(String url) async {
      if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    }

    // 認証フロー開始
    final authenticator = Authenticator(
      client,
      scopes: ['openid', 'profile', 'email', 'offline_access'],
      redirectUri: config.redirectUrl,
      port: config.redirectUrl.port,
      urlLancher: launch,
      prompt: 'login',
      additionalParameters: {
        'code_challenge': pkce.challenge,
        'code_challenge_method': 'S256',
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
    state.applyEvent(AuthCompleteEvent(token));
  }
}