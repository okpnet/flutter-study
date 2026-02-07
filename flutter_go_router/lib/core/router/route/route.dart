@TypeShellRoute<AppShellRoute>(
  routes: [
    TypedStatefulShellRoute<NavigationShellRoute>(),
    TypedGoRoute<LoginRoute>(path: LoginRoute.path, name: LoginRoute.name),
    TypedGoRoute<MaintenanceRoute>(
      path: MaintenanceRoute.path,
      name: MaintenanceRoute.name,
    ),
    TypedGoRoute<TutorialRoute>(
      path: TutorialRoute.path,
      name: TutorialRoute.name,
    ),
  ],
)
class AppShellRoute extends ShellRouteData {}
