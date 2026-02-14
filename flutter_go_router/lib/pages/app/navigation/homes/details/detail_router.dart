import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/homes/details/detail_page.dart'
    as home;
import 'package:go_router/go_router.dart';

part 'detail_router.g.dart';

const String homeDetailpath = '/home/detail';

@TypedGoRoute<DetailRouter>(path: homeDetailpath)
class DetailRouter extends GoRouteData with $DetailRouter {
  const DetailRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: implement build
    return home.DetailPage();
  }
}
