import 'package:flutter/cupertino.dart';
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
    final expired = ref.watch(expiredHandlerProvider);
    final oauth = ref.watch(keycloakProvider);
    expired.disable();

    return FutureBuilder(
      future: Future.wait([oauth.logout()]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoActivityIndicator(),
                  SizedBox(height: 20),
                  Text("Logout..."),
                ],
              ),
            ),
          );
        } else {
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
                              ExpiredStateEvent(
                                value: ExpiredStateType.signedOut,
                              ),
                            ),
                          );
                      expired.enable();
                      final handler = ExpiredRouteHandler.resetCreate(
                        pages: [AppPage.top],
                        funcState: () => ref.read(authStateProvider),
                      );
                      ref.read(routeStateProvider.notifier).update(handler);
                    },
                    child: const Text("トップページへ戻る"),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
