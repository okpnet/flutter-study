// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$detailRouter];

RouteBase get $detailRouter => GoRouteData.$route(
  path: 'detail/:id',
  name: 'homeDetail',
  factory: $DetailRouter._fromState,
);

mixin $DetailRouter on GoRouteData {
  static DetailRouter _fromState(GoRouterState state) =>
      DetailRouter(id: state.pathParameters['id']!);

  DetailRouter get _self => this as DetailRouter;

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
