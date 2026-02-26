import 'package:flutter/material.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/frame/frame_page.dart';
import 'package:go_router/go_router.dart';

class FrameRouter extends StatefulShellRouteData {
  const FrameRouter();
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    // TODO: implement builder
    return FramePage(navigationShell: navigationShell);
  }
}
