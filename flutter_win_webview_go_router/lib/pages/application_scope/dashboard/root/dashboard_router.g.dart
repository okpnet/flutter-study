// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$dashboardRouter];

RouteBase get $dashboardRouter => GoRouteData.$route(
  path: '/',
  name: 'dashboard',
  factory: $DashboardRouter._fromState,
);

mixin $DashboardRouter on GoRouteData {
  static DashboardRouter _fromState(GoRouterState state) =>
      const DashboardRouter();

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
