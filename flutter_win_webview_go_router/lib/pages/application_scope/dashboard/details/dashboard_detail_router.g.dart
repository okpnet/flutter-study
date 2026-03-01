// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_detail_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$dashboardDetailRouter];

RouteBase get $dashboardDetailRouter => GoRouteData.$route(
  path: 'detail/:id',
  name: 'DashboardDetail',
  factory: $DashboardDetailRouter._fromState,
);

mixin $DashboardDetailRouter on GoRouteData {
  static DashboardDetailRouter _fromState(GoRouterState state) =>
      DashboardDetailRouter(id: state.pathParameters['id']!);

  DashboardDetailRouter get _self => this as DashboardDetailRouter;

  @override
  String get location =>
      GoRouteData.$location('detail/${Uri.encodeComponent(_self.id)}');

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
