import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/logout/logout_router.dart';
import 'package:flutter_win_webview_go_router/provider/router/root_router.dart';

class SharedLogoutButton extends ConsumerWidget {
  const SharedLogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      icon: Icon(Icons.logout),
      onPressed: () {
        log("ログアウトが押されました");
        ref.read(rootRouterProvider).go(LogoutConstant.path, extra: ref);
        // ref.watch(authProvider.notifier).changeState(ExpiredStateType.signedOut);
      },
      label: const Text("ログアウト"),
    );
  }
}
