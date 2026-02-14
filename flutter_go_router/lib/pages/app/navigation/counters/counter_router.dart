import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/counters/counter_page.dart';
import 'package:go_router/go_router.dart';

part 'counter_router.g.dart';

const String counterPath = '/counter';
const String counterName = 'counter';

@TypedGoRoute<CounterRouter>(path: counterPath, name: counterName)
class CounterRouter extends GoRouteData with $CounterRouter {
  const CounterRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: implement build
    return CounterPage();
  }
}
