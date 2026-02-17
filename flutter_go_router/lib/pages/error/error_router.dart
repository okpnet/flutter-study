import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/error/error_page.dart';
import 'package:go_router/go_router.dart';

part 'error_router.g.dart';

const String errorPath = '/error';
const String errorName = 'Error';

@TypedGoRoute<ErrorRouter>(path: errorPath, name: errorName)
class ErrorRouter extends GoRouteData with $ErrorRouter {
  const ErrorRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ErrorPage(exception: state.extra as Exception);
  }
}
