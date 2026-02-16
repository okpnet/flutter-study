// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$logoutRouter];

RouteBase get $logoutRouter => GoRouteData.$route(
  path: '/logout',
  name: 'Logout',
  factory: $LogoutRouter._fromState,
);

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
