// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$counterRouter];

RouteBase get $counterRouter => GoRouteData.$route(
  path: '/counter',
  name: 'counter',
  factory: $CounterRouter._fromState,
);

mixin $CounterRouter on GoRouteData {
  static CounterRouter _fromState(GoRouterState state) => const CounterRouter();

  @override
  String get location => GoRouteData.$location('/counter');

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
