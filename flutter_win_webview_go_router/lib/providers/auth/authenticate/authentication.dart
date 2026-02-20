import 'dart:async';

import 'package:flutter_win_webview_go_router/providers/auth/callback/callback_server.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  const Authentication();

  @override
  FutureOr<ExpiredStateType> build() {}
}
