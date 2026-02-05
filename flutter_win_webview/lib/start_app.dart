import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/providers/auth_providers/auth_state.dart';
import 'package:flutter_win_webview/providers/inialize.dart';
import 'package:flutter_win_webview/providers/router_providers/router_state.dart';

final class StartApp extends ConsumerWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: Future.wait([ref.watch(initializeProvider(DEFAULT_PORT).future)]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoActivityIndicator(),
                  SizedBox(height: 20),
                  Text("Loading..."),
                ],
              ),
            ),
          );
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final handler = ExpiredRouteHandler.resetCreate(
              pages: [AppPage.top],
              funcState: () => ref.read(authStateProvider),
            );
            ref.read(routeStateProvider.notifier).update(handler);
          });

          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoActivityIndicator(),
                  SizedBox(height: 10),
                  Text("Done..."),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
