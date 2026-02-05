import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/auths/models/iauth_uri_model.dart';
import 'package:flutter_win_webview/auths/models/keycloak_uri_model.dart';
import 'package:flutter_win_webview/auths/providers/expired_state_event.dart';
import 'package:flutter_win_webview/auths/providers/iauth_provider.dart';
import 'package:flutter_win_webview/auths/providers/keycloak_provider.dart';
import 'package:flutter_win_webview/providers/auth_providers/auth_state.dart';
import 'package:flutter_win_webview/providers/router_providers/router_state.dart';
import 'package:flutter_win_webview/storeges/istorage_reader_writer.dart';
import 'package:flutter_win_webview/storeges/secure_storage_reader_writer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'inialize.g.dart';

const int DEFAULT_PORT = 45035;

@Riverpod(keepAlive: true)
Future<void> initialize(Ref ref, int port) async {
  log('initialize: Starting initialization on port $port');
  ref.onDispose(() {
    ref
      ..invalidate(keycloakProvider)
      ..invalidate(readerWriterProvider)
      ..invalidate(expiredHandlerProvider)
      ..invalidate(authUriModelProvider)
      ..invalidate(authStateProvider)
      ..invalidate(routeStateProvider);
  });
  //
  //callBackServerProviderがkeycloakProviderを参照するので、そのときに作られてしまう。
  //ここで先にkeycloakProviderを作成しておく。
  ref.watch(authStateProvider);
  ref.watch(authUriModelProvider);
  ref.watch(readerWriterProvider);
  ref.watch(expiredHandlerProvider);
  ref.watch(keycloakProvider);

  await Future.delayed(const Duration(seconds: 3));
  log('initialize: Initialization completed on port $port');
}

/// 接続モデル（Keycloak の URI 構成）
@Riverpod(keepAlive: true)
IAuthUriModel authUriModel(Ref ref) {
  final uriModel = KeycloakUriModel.generate(
    keycloakUrl: 'https://qmspi.local:8443/',
    // keycloakUrl: 'https://okp-04.local:8443',
    clientId: 'qual-app',
    realms: 'pms',
    redirectUri: 'http://127.0.0.1:45035/callback',
    scopes: ['openid', 'profile', 'email'],
  );
  return uriModel;
}

/// ストレージ（SecureStorage）
@riverpod
IStorageReaderWriter readerWriter(Ref ref) {
  return SecureStorageReaderWriter();
}

/// 期限切れイベントのハンドラ
@riverpod
ExpiredEventHandler expiredHandler(Ref ref) {
  return ExpiredEventHandler(ref);
}

/// Keycloak を使った OAuth サービスプロバイダ
@riverpod
IAuthProvider keycloak(Ref ref) {
  final authUri = ref.watch(authUriModelProvider);
  final rw = ref.watch(readerWriterProvider);
  final handler = ref.watch(expiredHandlerProvider);

  final provider = KeycloakProvider.create(
    authUriModel: authUri,
    readWriter: rw,
  );

  // onChange を監視して ExpiredEvent をハンドル
  final sub = provider.onChange.listen(handler.handle);

  // 破棄時に購読解除（リーク防止）
  ref.onDispose(() {
    sub.cancel();
    // 必要なら provider のクリーンアップもここで
    unawaited(provider.dispose());
  });

  return provider;
}

/// ---- 付帯クラス ----
class ExpiredEventHandler {
  ExpiredEventHandler(this.ref);

  final Ref ref;

  bool _enabled = true;

  void enable() => _enabled = true;
  void disable() => _enabled = false;

  void handle(ExpiredStateEvent event) {
    if (!_enabled) return;
    // 通常処理：グローバルな認証状態を更新
    ref.read(authStateProvider.notifier).update(AuthState.crate(event));
    log('ExpiredEventHandler: handle event=$event');
  }
}
