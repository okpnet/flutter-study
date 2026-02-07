part of '../route.dart';

class MaintenanceRoute extends GoRouteData with _$MaintenanceRoute {
  const MaintenanceRoute();

  static const String path = '/maintenance';
  static const String name = 'maintenance_screen';

  @override
  Widget build(BuildContext context) {
    return const MaintenanceScreen();
  }
}
