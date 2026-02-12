
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

part 'seconds/_router.dart';

part 'page_route.g.dart';

@TypedShellRoute<AppShellRoute>(
  routes:[
    TypedGoRoute<SecoundsRouter>(
      path: SecoundRouter.path,
      name: 'SecoundsRouter',
    ),
  ])