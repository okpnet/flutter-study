import 'package:flutter/material.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/frame/frame_router.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/error/error_router.dart';
import 'package:flutter_win_webview_go_router/pages/_controller/page_controller_page.dart';
import 'package:go_router/go_router.dart';

part '../page_controller/app_root_router.g.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<AppRootRouter>(
  routes: [
    TypedStatefulShellRoute<FrameRouter>(
      branches: [
        TypedStatefulShellBranch<HomeBranch>(
          routes: [
            TypedGoRoute<HomeRouter>(
              path: homeRouterPath,
              name: homeRouterName,
              routes: [
                TypedGoRoute<DetailRouter>(
                  path: homeDetailpath,
                  name: homeDetailName,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedGoRoute<LoginRouter>(path: loginPath, name: loginName),
    TypedGoRoute<LogoutRouter>(path: logoutPath, name: logoutName),
    TypedGoRoute<ErrorRouter>(path: errorPath, name: errorName),
  ],
)
class AppRootRouter extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  const AppRootRouter();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return PageControllerPage(navigator: navigator);
  }
}
