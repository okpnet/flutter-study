import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'callback_server.g.dart';

// ローカルサーバーがコールバックを受け取るOAuth
@Riverpod(keepAlive: true)
Future<HttpServer> callBackServer(Ref ref, {required int port}) async {
  // final provider = ref.watch(keycloakProvider);
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

  ref.onDispose(() {
    unawaited(server.close());
    log('Callback server: Server closed on dispose.');
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
        final handler = ExpiredRouteHandler.popCreate(pages: []);
        ref.read(routeStateProvider.notifier).update(handler);
      }),
    );
  });

  return server;
}

class Riverpod {
  const Riverpod({required bool keepAlive});
}
