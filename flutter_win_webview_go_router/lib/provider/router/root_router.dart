import 'package:flutter/material.dart';
import 'package:flutter_win_webview_go_router/pages/_controller/page_controller_router.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/error/error_page.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/login/login_router.dart'
    hide $appRoutes;
import 'package:flutter_win_webview_go_router/provider/refresh_listener/refresh_listenable.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'root_router.g.dart';

//ルータープロバイダ
@Riverpod(keepAlive: true)
GoRouter rootRouter(Ref ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: LoginConstant.path,
    routes: $appRoutes, //ルートの$appRoutesでなければ、全てのGoRouteDataが含まれていない。
    refreshListenable: ref.read(refreshListenableProvider),
    //redirect: (_, state) => ref.read(redirectControllerProvider).call(state),
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorPage());
    },
  );
}
