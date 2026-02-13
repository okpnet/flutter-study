import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/homes/home_page.dart';
import 'package:go_router/go_router.dart';

part 'home_router.g.dart';

@TypedGoRoute<HomeRouter>(path: '/home', name: 'home')
class HomeRouter extends GoRouteData with $HomeRouter {
  const HomeRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: implement build
    return HomePage();
  }
}
