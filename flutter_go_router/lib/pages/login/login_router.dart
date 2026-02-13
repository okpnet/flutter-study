import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/login/login_page.dart';
import 'package:go_router/go_router.dart';

part 'login_router.g.dart';

@TypedGoRoute<LoginRouter>(path: '/login', name: 'Login')
class LoginRouter extends GoRouteData with $LoginRouter {
  const LoginRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPage();
  }
}
