import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_win_webview/extends/keycloak_access_model.dart';
import 'package:webview_win_floating/webview_win_floating.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http; // ★ 追加：トークン交換用

class WebWidget extends StatefulWidget {
  const WebWidget({super.key});

  @override
  State<WebWidget> createState() => _WebWidgetState();
}

class _WebWidgetState extends State<WebWidget> {
  final _controller = WebViewController();
  KeycloakAccessModel? _keycloakModel;
  HttpServer? _server;

  @override
  void initState() {
    // 非同期の初期化を分離
    unawaited(_startAuthFlow());
  }

  @override
  void dispose() {
    unawaited(_server?.close(force: true));
    super.dispose();
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

  Future<void> _startAuthFlow() async {
    // ★ 1) 先にローカルHTTPサーバを起動
    _server = await HttpServer.bind(InternetAddress.loopbackIPv4, 45035);

    unawaited(_waitForCallback()); // バックグラウンドで待ち受け
    _keycloakModel = KeycloakAccessModel.generate(
      keycloakUrl: 'https://qmspi.local:8443/',
      //keycloakUrl: 'https://okp-04.local:8443',
      realms: 'pms',
      clientId: 'qual-app',
      redirectUri: 'http://127.0.0.1:45035/callback',
      scopes: ['openid', 'profile', 'email'],
    );

    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (req) {
            final uri = Uri.parse(req.url);
            log('URL:${uri.toString()}');
            // ここで 127.0.0.1 の遷移を捕捉して prevent しても良いが、
            // ★ サーバがレスポンスを返さないとUXが真っ白になるため、
            // 基本は allow でOK（サーバが「戻っています」HTMLを返す）
            if (uri.scheme == 'http' &&
                (uri.host == '127.0.0.1' || uri.host == 'localhost') &&
                uri.path == '/callback') {
              // NavigationDecision.prevent でもよいが、先にサーバ応答させたい
              return NavigationDecision.navigate;
            }
            if (uri.scheme == 'myapp' && uri.host == 'callback') {
              final code = uri.queryParameters['code'];
              if (code != null) {
                // Handle the authorization code
                print('Authorization code: $code');
              }
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(_keycloakModel!.authorizationUrl);
  }

  Future<void> _exchangeToken(String code) async {
    try {
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

        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('サインイン成功（トークン取得）')));

        // TODO: トークンの安全な保管＆画面遷移
      } else {
        log('Token exchange failed: ${res.statusCode} ${res.body}');
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('トークン取得失敗: ${res.statusCode}')));
      }
    } catch (e, st) {
      log('Token exchange error: $e\n$st');
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('エラー: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web Widget')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
