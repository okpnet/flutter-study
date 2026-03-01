import 'package:flutter/material.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/dashboard/details/dashboard_detail__page.dart';
import 'package:go_router/go_router.dart';

part 'dashboard_detail_router.g.dart';

class DashboardDetailConstant {
  static const String path = 'detail/:id';
  static const String name = 'DashboardDetail';
}

@TypedGoRoute<DashboardDetailRouter>(
  path: DashboardDetailConstant.path,
  name: DashboardDetailConstant.name,
)
class DashboardDetailRouter extends GoRouteData with $DashboardDetailRouter {
  final String id;
  const DashboardDetailRouter({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DashboardDetailPage(id: id);
  }
}
