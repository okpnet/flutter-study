import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/app_router_delegate.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouterDelegate(ref),
      routeInformationParser: const _NoopParser(),
    );
  }
}

/// Navigator2 を使う場合、最低限の Parser が必要。
/// 今回は URL を使わないので No-op（何もしない）で OK。
class _NoopParser extends RouteInformationParser<Object> {
  const _NoopParser();

  @override
  Future<Object> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    return Object();
  }
}
