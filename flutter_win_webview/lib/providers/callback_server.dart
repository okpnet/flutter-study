import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'callback_server.g.dart';

@riverpod
Future<HttpServer> callBackServer(Ref ref) async {
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 45035);
  return server;
}
