// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$settingRouter];

RouteBase get $settingRouter => GoRouteData.$route(
  path: '/setting',
  name: 'setting',
  factory: $SettingRouter._fromState,
);

mixin $SettingRouter on GoRouteData {
  static SettingRouter _fromState(GoRouterState state) => const SettingRouter();

  @override
  String get location => GoRouteData.$location('/setting');

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
