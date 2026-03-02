import 'package:flutter/material.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/dashboard/root/dashboard_page.dart';
import 'package:go_router/go_router.dart';

part 'dashboard_router.g.dart';

class DashboradConstant {
  static const String path = '/dashboard';
  static const String name = 'Dashboard';
}

@TypedGoRoute<DashboardRouter>(
  path: DashboradConstant.path,
  name: DashboradConstant.name,
)
class DashboardRouter extends GoRouteData with $DashboardRouter {
  const DashboardRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: implement build
    return DashboardPage();
  }
}
