import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/app_root_page.dart';
import 'package:go_router/go_router.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<AppRouter>(
  routes: TypedStatefulShellRoute<NavigationShellRoute>(),
)
class AppRouter extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  const AppRouter();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    // TODO: implement builder
    return AppRootPage(navigator: navigator);
  }
}
