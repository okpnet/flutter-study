import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/auths/providers/web_auth_mixin.dart';
import 'package:flutter_win_webview/keycloak_services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebWidget extends ConsumerStatefulWidget {
  const WebWidget({super.key});

  @override
  ConsumerState<WebWidget> createState() => _WebWidgetState();
}

class _WebWidgetState extends ConsumerState<WebWidget> {
  final _controller = WebViewController();
  // KeycloakAccessModel? _keycloakModel;
  // HttpServer? _server;

  @override
  void initState() {
    super.initState();
    _createController();
  }

  @override
  void dispose() {
    // unawaited(_server?.close(force: true));
    super.dispose();
  }

  void _createController() {
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (req) {
            final uri = Uri.parse(req.url);
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
                log('Authorization code: $code');
              }
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    // 非同期の初期化を分離
    final resultWidget = ref
        .watch(keycloakProvider)
        .when(
          data: (value) {
            value.onChange.listen((e) {
              if (e.value == ExpiredStateType.enabled) {
                //ログイン完了ページ移動
                log('logined.');
              } else {
                //ログイン完了後にPOST通信失敗
                log('post failed.');
              }
            });
            final uriModel = (value as WebAuthMixin).authUriModel;
            _controller.loadRequest(uriModel.authorizationUrl);
            return Scaffold(
              appBar: AppBar(title: const Text('Web Widget')),
              body: WebViewWidget(controller: _controller),
            );
          },
          error: (error, stack) => Text('Oops, something unexpected happened'),
          loading: () {
            Scaffold(
              appBar: AppBar(title: const Text('Web Widget')),
              body: CircularProgressIndicator(),
            );
          },
        );

    return resultWidget ??
        Scaffold(
          appBar: AppBar(title: const Text('Web Widget')),
          body: CircularProgressIndicator(),
        );
  }
}
