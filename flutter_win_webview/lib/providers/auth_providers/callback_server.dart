import 'dart:async';
import 'dart:io';
import 'package:flutter_win_webview/providers/inialize.dart';
import 'package:flutter_win_webview/providers/router_providers/router_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer';
part 'callback_server.g.dart';

@Riverpod(keepAlive: true)
Future<HttpServer> callBackServer(Ref ref, {required int port}) async {
  final provider = ref.watch(keycloakProvider);
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

  ref.onDispose(() {
    unawaited(server.close());
  });

  server.listen((HttpRequest request) {
    final uri = request.uri;

    // ユーザー向けに軽いHTMLを返答（真っ白回避）
    request.response.headers.contentType = ContentType.html;
    request.response.write(
      '<html><body>サインイン処理に戻っています。ウィンドウを閉じても構いません。</body></html>',
    );

    final code = uri.queryParameters['code'];
    unawaited(
      provider.login(code).whenComplete(() {
        log('Callback server: login process completed.');
        final handler = ExpiredRouteHandler(pages: []);
        handler.pop();
        ref.read(routeStateProvider.notifier).update(handler);
      }),
    );
  });

  return server;
}
