// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$errorRouter];

RouteBase get $errorRouter => GoRouteData.$route(
  path: '/error',
  name: 'Error',
  factory: $ErrorRouter._fromState,
);

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
