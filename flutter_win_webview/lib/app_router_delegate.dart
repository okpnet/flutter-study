import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/keycloak_services.dart';
import 'package:flutter_win_webview/logout_page.dart';
import 'package:flutter_win_webview/router_state.dart';
import 'package:flutter_win_webview/top_page.dart';
import 'package:flutter_win_webview/web_widget.dart';

class AppRouterDelegate extends RouterDelegate<Object>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Object> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final WidgetRef ref;

  AppRouterDelegate(this.ref) {
    ref.listen(routeStateProvider, (_, __) => notifyListeners());
  }

  @override
  Widget build(BuildContext context) {
    final routeState = ref.watch(routeStateProvider);
    final authState = ref.watch(authStateProvider);
    final pages = routeState.stack.map((page) {
      switch (page) {
        case AppPage.top:
          return MaterialPage(child: TopPage());
        case AppPage.loggedOut:
          return MaterialPage(child: LoggedOutPage());
      }
    }).toList();

    if (authState.value == ExpiredStateType.signedOut) {
      pages.add(MaterialPage(child: WebWidget()));
    }

    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        final stack = [...routeState.stack];
        if (stack.length > 1) {
          stack.removeLast();
          ref.read(routeStateProvider.notifier).state = RouteState(stack);
        }
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Object configuration) async {}
}

class AppNavigatorObserver extends NavigatorObserver {
  final WidgetRef ref;

  AppNavigatorObserver(this.ref);

  @override
  void didRemove(Route route, Route? previousRoute) {
    final state = ref.read(routeStateProvider);

    // スタックが1つ以上ある場合だけ pop 相当を行う
    if (state.stack.length > 1) {
      final newStack = [...state.stack]..removeLast();
      ref.read(routeStateProvider.notifier).state = RouteState(newStack);
    }
  }
}
