// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_controller_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$pageControllerRouter];

RouteBase get $pageControllerRouter => ShellRouteData.$route(
  navigatorKey: PageControllerRouter.$navigatorKey,
  factory: $PageControllerRouterExtension._fromState,
  routes: [
    StatefulShellRouteData.$route(
      factory: $FrameRouterExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/dashboard',
              name: 'Dashboard',
              factory: $DashboardRouter._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'detail/:id',
                  name: 'DashboardDetail',
                  factory: $DashboardDetailRouter._fromState,
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

extension $PageControllerRouterExtension on PageControllerRouter {
  static PageControllerRouter _fromState(GoRouterState state) =>
      const PageControllerRouter();
}

extension $FrameRouterExtension on FrameRouter {
  static FrameRouter _fromState(GoRouterState state) => const FrameRouter();
}

mixin $DashboardRouter on GoRouteData {
  static DashboardRouter _fromState(GoRouterState state) =>
      const DashboardRouter();

  @override
  String get location => GoRouteData.$location('/dashboard');

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

mixin $DashboardDetailRouter on GoRouteData {
  static DashboardDetailRouter _fromState(GoRouterState state) =>
      DashboardDetailRouter(id: state.pathParameters['id']!);

  DashboardDetailRouter get _self => this as DashboardDetailRouter;

  @override
  String get location => GoRouteData.$location(
    '/dashboard/detail/${Uri.encodeComponent(_self.id)}',
  );

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
