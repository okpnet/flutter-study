import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/app_root_page.dart';
import 'package:flutter_go_router/pages/app/navigation/homes/details/detail_router.dart';
import 'package:flutter_go_router/pages/app/navigation/homes/home_branch.dart';
import 'package:flutter_go_router/pages/app/navigation/homes/home_router.dart';
import 'package:flutter_go_router/pages/app/navigation/navigation_root_router.dart';
import 'package:flutter_go_router/pages/login/login_page.dart';
import 'package:flutter_go_router/pages/login/login_router.dart';
import 'package:go_router/go_router.dart';

part 'app_root_router.g.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<AppRootRouter>(
  routes: [
    TypedStatefulShellRoute<NavigationRootRouter>(
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
  ],
)
class AppRootRouter extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  const AppRootRouter();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppRootPage(navigator: navigator);
  }
}
