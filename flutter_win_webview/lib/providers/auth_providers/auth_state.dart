import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/auths/providers/expired_state_event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

@riverpod
class AuthState extends _$AuthState {
  ExpiredStateEvent expiredEvent = ExpiredStateEvent(
    value: ExpiredStateType.signedOut,
  );

  AuthState();

  @override
  AuthState build() {
    // ここで初期状態を返す（非同期なら Future<String> にする）
    return this;
  }

  factory AuthState.crate(ExpiredStateEvent event) {
    final state = AuthState();
    state.expiredEvent = event;
    return state;
  }

  void update(AuthState newState) {
    state = newState; // 内部では state にアクセス可能
  }
}
