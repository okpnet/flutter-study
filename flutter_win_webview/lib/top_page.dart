import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/keycloak_services.dart';
import 'package:flutter_win_webview/providers/router_providers/router_state.dart';
import 'package:flutter_win_webview/screenlibs/overlay_loading.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top Page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Hello World"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                log("ログアウトボタンが押されました");
                ref
                    .read(routeStateProvider.notifier)
                    .update(RouteState.crate([AppPage.top, AppPage.loggedOut]));
              },
              child: const Text("ログアウト"),
            ),
          ],
        ),
      ),
    );
  }
}
