part of '../route.dart';

class TutorialRoute extends GoRouteData with _$TutorialRoute {
  const TutorialRoute();

  static const String path = '/tutorial';
  static const String name = 'tutorial_screen';

  @override
  Widget build(BuildContext context) {
    return const TutorialScreen();
  }
}
