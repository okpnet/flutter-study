import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_win_webview_go_router/pages/_shared/indicator/overlay_indicator.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/logout/logout_router.dart';
import 'package:flutter_win_webview_go_router/provider/router/root_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_authenticator/provider/auth_controller.dart';

class SharedLogoutButton extends HookConsumerWidget {
  const SharedLogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogout = useState<bool>(false);
    final authprovider = ref.read(authControllerProvider.notifier);
    return Stack(
      children: [
        ElevatedButton.icon(
          icon: Icon(Icons.logout),
          onPressed: () {
            log("ログアウトが押されました");

            authprovider.logout();
            // ref.read(rootRouterProvider).go(LogoutConstant.path, extra: ref);
            // ref.watch(authProvider.notifier).changeState(ExpiredStateType.signedOut);
          },
          label: const Text("ログアウト"),
        ),
        OverlayIndicator(show: isLogout.value),
      ],
    );
  }
}
