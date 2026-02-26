import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  return server;
}
