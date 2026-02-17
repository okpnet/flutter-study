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
              path: '/',
              name: 'home',
              factory: $HomeRouter._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'detail/:id',
                  name: 'homeDetail',
                  factory: $DetailRouter._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/login',
      name: 'Login',
      factory: $LoginRouter._fromState,
    ),
    GoRouteData.$route(
      path: '/logout',
      name: 'Logout',
      factory: $LogoutRouter._fromState,
    ),
    GoRouteData.$route(
      path: '/error',
      name: 'Error',
      factory: $ErrorRouter._fromState,
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
  String get location => GoRouteData.$location('/');

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

mixin $DetailRouter on GoRouteData {
  static DetailRouter _fromState(GoRouterState state) =>
      DetailRouter(id: state.pathParameters['id']!);

  DetailRouter get _self => this as DetailRouter;

  @override
  String get location =>
      GoRouteData.$location('/detail/${Uri.encodeComponent(_self.id)}');

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

mixin $LoginRouter on GoRouteData {
  static LoginRouter _fromState(GoRouterState state) => const LoginRouter();

  @override
  String get location => GoRouteData.$location('/login');

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

mixin $LogoutRouter on GoRouteData {
  static LogoutRouter _fromState(GoRouterState state) => const LogoutRouter();

  @override
  String get location => GoRouteData.$location('/logout');

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

mixin $ErrorRouter on GoRouteData {
  static ErrorRouter _fromState(GoRouterState state) => const ErrorRouter();

  @override
  String get location => GoRouteData.$location('/error');

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
