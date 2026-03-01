import 'package:flutter/material.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/dashboard/branch/dashboard_branch.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/dashboard/details/dashboard_detail_router.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/dashboard/root/dashboard_router.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/frame/frame_router.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/error/error_router.dart';
import 'package:flutter_win_webview_go_router/pages/_controller/page_controller_page.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/login/login_router.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/logout/logout_router.dart';
import 'package:go_router/go_router.dart';

part 'page_controller_router.g.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<PageControllerRouter>(
  routes: [
    TypedStatefulShellRoute<FrameRouter>(
      branches: [
        TypedStatefulShellBranch<DashboardBranch>(
          routes: [
            TypedGoRoute<DashboardRouter>(
              path: DashboradConstant.path,
              name: DashboradConstant.name,
              routes: [
                TypedGoRoute<DashboardDetailRouter>(
                  path: DashboardDetailConstant.path,
                  name: DashboardDetailConstant.name,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedGoRoute<LoginRouter>(
      path: LoginConstant.path,
      name: LoginConstant.name,
    ),
    TypedGoRoute<LogoutRouter>(
      path: LogoutConstant.path,
      name: LogoutConstant.name,
    ),
    TypedGoRoute<ErrorRouter>(
      path: ErrorConstant.path,
      name: ErrorConstant.name,
    ),
  ],
)
class PageControllerRouter extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  const PageControllerRouter();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return PageControllerPage(navigator: navigator);
  }
}
