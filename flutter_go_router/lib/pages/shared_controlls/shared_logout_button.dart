import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/logout/logout_router.dart';
// import 'package:flutter_go_router/providers/auth/auth_notifier.dart';
import 'package:flutter_go_router/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedLogoutButton extends ConsumerWidget {
  const SharedLogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      icon: Icon(Icons.logout),
      onPressed: () {
        log("ログアウトが押されました");
        ref.read(routerProvider).go(logoutPath, extra: ref);
        // ref.watch(authProvider.notifier).changeState(ExpiredStateType.signedOut);
      },
      label: const Text("ログアウト"),
    );
  }
}
