import 'package:flutter_win_webview/auths/providers/expired_state_event.dart';

abstract interface class IAuthProvider {
  Stream<ExpiredStateEvent> get onChange;
  Future<void> refreshToken();
  Future<void> login(String? code);
  Future<void> logout();
}

abstract interface class IAuthUriProvider {}
