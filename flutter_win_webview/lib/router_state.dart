import 'package:flutter_riverpod/legacy.dart';

enum AppPage { top, loggedOut }

class RouteState {
  final List<AppPage> stack;
  RouteState(this.stack);

  RouteState clone() => RouteState(stack);

  RouteState replaceLast(AppPage replace) {
    stack.removeLast();
    return this;
  }
}

final routeStateProvider = StateProvider<RouteState>((ref) {
  return RouteState([AppPage.top]);
});
