import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/homes/home_page.dart';
import 'package:go_router/go_router.dart';

part 'home_router.g.dart';

const String homeRouterPath = '/';
const String homeRouterName = 'home';

@TypedGoRoute<HomeRouter>(path: homeRouterPath, name: homeRouterName)
class HomeRouter extends GoRouteData with $HomeRouter {
  const HomeRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: implement build
    return HomePage();
  }
}
