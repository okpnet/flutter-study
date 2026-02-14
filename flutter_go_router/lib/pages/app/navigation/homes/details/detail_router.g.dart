// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$detailRouter];

RouteBase get $detailRouter =>
    GoRouteData.$route(path: '/home/detail', factory: $DetailRouter._fromState);

mixin $DetailRouter on GoRouteData {
  static DetailRouter _fromState(GoRouterState state) => const DetailRouter();

  @override
  String get location => GoRouteData.$location('/home/detail');

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
