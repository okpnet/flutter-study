import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/error/error_page.dart';
import 'package:flutter_go_router/pages/login/login_router.dart';
import 'package:flutter_go_router/providers/refresh/refresh_listenable.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_go_router/pages/app/app_root_router.dart' as app_root;

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: loginPath,
    routes: app_root.$appRoutes,
    refreshListenable: ref.read(refreshListenableProvider),
    //redirect: (_, state) => ref.read(redirectControllerProvider).call(state),
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorPage());
    },
  );
}
