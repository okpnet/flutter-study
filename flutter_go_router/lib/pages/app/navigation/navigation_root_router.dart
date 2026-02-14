import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/navigation_page.dart';
import 'package:go_router/go_router.dart';

class NavigationRootRouter extends StatefulShellRouteData {
  const NavigationRootRouter();
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    // TODO: implement builder
    return NavigationPage(navigationShell: navigationShell);
  }
}
