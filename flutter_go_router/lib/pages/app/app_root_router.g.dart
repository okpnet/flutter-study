// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_root_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$appRootRouter];

RouteBase get $appRootRouter => ShellRouteData.$route(
  navigatorKey: AppRootRouter.$navigatorKey,
  factory: $AppRootRouterExtension._fromState,
  routes: [
    StatefulShellRouteData.$route(
      factory: $NavigationRootRouterExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/home',
              name: 'home',
              factory: $HomeRouter._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $AppRootRouterExtension on AppRootRouter {
  static AppRootRouter _fromState(GoRouterState state) => const AppRootRouter();
}

extension $NavigationRootRouterExtension on NavigationRootRouter {
  static NavigationRootRouter _fromState(GoRouterState state) =>
      const NavigationRootRouter();
}

mixin $HomeRouter on GoRouteData {
  static HomeRouter _fromState(GoRouterState state) => const HomeRouter();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
