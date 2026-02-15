import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/homes/details/detail_page.dart'
    as home;
import 'package:go_router/go_router.dart';

part 'detail_router.g.dart';

const String homeDetailpath = 'detail/:id';
const String homeDetailName = 'homeDetail';

@TypedGoRoute<DetailRouter>(path: homeDetailpath, name: homeDetailName)
class DetailRouter extends GoRouteData with $DetailRouter {
  final String id;
  const DetailRouter({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: implement build
    return home.DetailPage(id: id);
  }
}
