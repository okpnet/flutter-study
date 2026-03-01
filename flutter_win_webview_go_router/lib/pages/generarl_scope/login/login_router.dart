import 'package:flutter/material.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/login/login_page.dart';
import 'package:go_router/go_router.dart';

part 'login_router.g.dart';

class LoginConstant {
  static const String path = '/login';
  static const String name = 'Login';
}

@TypedGoRoute<LoginRouter>(path: LoginConstant.path, name: LoginConstant.name)
class LoginRouter extends GoRouteData with $LoginRouter {
  const LoginRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPage();
  }
}
