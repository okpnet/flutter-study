// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeRouter];

RouteBase get $homeRouter => GoRouteData.$route(
  path: '/home',
  name: 'home',
  factory: $HomeRouter._fromState,
);

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
