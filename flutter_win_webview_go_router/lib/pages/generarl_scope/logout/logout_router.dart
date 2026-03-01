import 'package:flutter/material.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/logout/logout_page.dart';
import 'package:go_router/go_router.dart';

part 'logout_router.g.dart';

class LogoutConstant {
  static const String path = '/logout';
  static const String name = 'Logout';
}

@TypedGoRoute<LogoutRouter>(
  path: LogoutConstant.path,
  name: LogoutConstant.name,
)
class LogoutRouter extends GoRouteData with $LogoutRouter {
  const LogoutRouter();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LogoutPage();
  }
}
