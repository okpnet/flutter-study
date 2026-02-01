import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/auths/providers/auth_providers.dart';
import 'package:flutter_win_webview/auths/providers/web_auth_mixin.dart';
import 'package:flutter_win_webview/keycloak_services.dart';
import 'package:flutter_win_webview/router_state.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebWidget extends ConsumerStatefulWidget {
  const WebWidget({super.key});

  @override
  ConsumerState<WebWidget> createState() => _WebWidgetState();
}

class _WebWidgetState extends ConsumerState<WebWidget> {
  HttpServer? server;
  //final _controller = WebViewController();
  // KeycloakAccessModel? _keycloakModel;
  // HttpServer? _server;

  // @override
  // void initState() {
  //   super.initState();
  //   _createController();
  // }
  // void _createController() {
  //   _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
  // ..setNavigationDelegate(
  //   NavigationDelegate(
  //     onNavigationRequest: (req) {
  //       final uri = Uri.parse(req.url);
  //       // ここで 127.0.0.1 の遷移を捕捉して prevent しても良いが、
  //       // ★ サーバがレスポンスを返さないとUXが真っ白になるため、
  //       // 基本は allow でOK（サーバが「戻っています」HTMLを返す）
  //       if (uri.scheme == 'http' &&
  //           (uri.host == '127.0.0.1' || uri.host == 'localhost') &&
  //           uri.path == '/callback') {
  //         // NavigationDecision.prevent でもよいが、先にサーバ応答させたい
  //         return NavigationDecision.navigate;
  //       }
  //       if (uri.scheme == 'myapp' && uri.host == 'callback') {
  //         final code = uri.queryParameters['code'];
  //         if (code != null) {
  //           // Handle the authorization code
  //           log('Authorization code: $code');
  //         }
  //         return NavigationDecision.prevent;
  //       }
  //       return NavigationDecision.navigate;
  //     },
  //   ),
  // );
  // }

  @override
  Widget build(BuildContext context) {
    WebViewController? controller;

    final uriModel = ref.watch(authUriModelProvider);
    final provider = ref.watch(keycloakProvider);
    return FutureBuilder(
      future: (() async {
        try {
          server ??= await HttpServer.bind(InternetAddress.loopbackIPv4, 45035);
          controller = WebViewController();
          controller?.setJavaScriptMode(JavaScriptMode.unrestricted);
          await controller!.clearCache();
          await controller!.loadRequest(uriModel.authorizationUrl);
          await serverInit(server!, provider);
          return true;
        } catch (e) {
          log(e.toString());
          return false;
        }
      })(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: const Text('Web Widget')),
            body: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          throw Exception('move errorpage');
        }

        // provider.onChange.listen((e) {
        //   if (e.value == ExpiredStateType.enabled) {
        //     //ログイン完了ページ移動
        //     log('logined.');
        //     ref.read(routeStateProvider.notifier).state = RouteState([
        //       AppPage.top,
        //     ]);
        //   } else {
        //     //ログイン完了後にPOST通信失敗
        //     log('post failed.');
        //   }
        // });
        return Scaffold(
          appBar: AppBar(title: const Text('Web Widget')),
          body: WebViewWidget(controller: controller!),
        );
      },
    );
  }

  Future<void> serverInit(HttpServer server, IAuthProvider provider) async {
    final req = await server.firstWhere((r) => r.uri.path == '/callback');
    final uri = req.uri;

    // ユーザー向けに軽いHTMLを返答（真っ白回避）
    req.response.headers.contentType = ContentType.html;
    req.response.write(
      '<html><body>サインイン処理に戻っています。ウィンドウを閉じても構いません。</body></html>',
    );

    await req.response.close();
    final code = uri.queryParameters['code'];
    await provider.login(code);
    ref.read(routeStateProvider.notifier).state = RouteState([AppPage.top]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    unawaited(server?.close());
  }
}
