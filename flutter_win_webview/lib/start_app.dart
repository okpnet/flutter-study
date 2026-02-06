import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/overlays/loading_screen.dart';
import 'package:flutter_win_webview/providers/auth_providers/auth_state.dart';
import 'package:flutter_win_webview/providers/inialize.dart';
import 'package:flutter_win_webview/providers/router_providers/router_state.dart';

final class StartApp extends ConsumerStatefulWidget {
  const StartApp({super.key});

  @override
  ConsumerState<StartApp> createState() => _StartAppState();
}

class _StartAppState extends ConsumerState<StartApp> {
  @override
  void initState() {
    super.initState();
    //ref.read(loadingScreenStateProvider.notifier).update(true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([ref.watch(initializeProvider(DEFAULT_PORT).future)]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 2.0, // ← ここで2倍に拡大
                    child: const CupertinoActivityIndicator(),
                  ),
                  const SizedBox(height: 10),
                  const Text("Loading..."),
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
