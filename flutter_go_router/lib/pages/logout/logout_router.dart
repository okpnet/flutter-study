import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/logout/logout_page.dart';
import 'package:go_router/go_router.dart';

part 'logout_router.g.dart';

const String logoutPath = '/logout';
const String logoutName = 'Logout';

@TypedGoRoute<LogoutRouter>(path: logoutPath, name: logoutName)
class LogoutRouter extends GoRouteData with $LogoutRouter {
  const LogoutRouter();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LogoutPage();
  }
}
