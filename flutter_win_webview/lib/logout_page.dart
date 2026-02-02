import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/auths/providers/auth_providers.dart';
import 'package:flutter_win_webview/providers/auth_providers/auth_state.dart';
import 'package:flutter_win_webview/providers/inialize.dart';
import 'package:flutter_win_webview/providers/router_providers/router_state.dart';

class LoggedOutPage extends ConsumerWidget {
  const LoggedOutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handler = ref.watch(expiredHandlerProvider);
    final provider = ref.watch(keycloakProvider);

    handler.disable();
    provider.logout();

    return Scaffold(
      appBar: AppBar(title: const Text("Logged Out")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("ログアウトしました"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(authStateProvider.notifier)
                    .update(
                      AuthState.crate(
                        ExpiredStateEvent(value: ExpiredStateType.signedOut),
                      ),
                    );
                handler.enable();
                ref
                    .read(routeStateProvider.notifier)
                    .update(RouteState.crate([AppPage.top]));
              },
              child: const Text("トップページへ戻る"),
            ),
          ],
        ),
      ),
    );
  }
}
