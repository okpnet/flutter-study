import 'dart:developer';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/auths/providers/expired_state_event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

/// 認証状態を管理する StateNotifier
@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  ExpiredStateEvent expiredEvent = ExpiredStateEvent(
    value: ExpiredStateType.signedOut,
  );

  AuthState();

  @override
  AuthState build() {
    // ここで初期状態を返す（非同期なら Future<String> にする）
    log('AuthState build: expiredEvent=${expiredEvent.value}');
    return this;
  }

  factory AuthState.crate(ExpiredStateEvent event) {
    final state = AuthState();
    state.expiredEvent = event;
    return state;
  }

  void update(AuthState newState) {
    log('AuthState update: newState=${newState.expiredEvent.value}');
    state = newState; // 内部では state にアクセス可能
  }
}
