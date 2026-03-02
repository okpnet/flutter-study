import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_win_webview_go_router/pages/_shared/indicator/overlay_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:pms_authenticator/auth_controller.dart';

enum WebViewState { none, initiControler, pageLoading, pageLoaded }

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = useState<bool>(true);

    WebViewController? controller = useMemoized(() => WebViewController());
    controller!.setJavaScriptMode(JavaScriptMode.unrestricted);
    final authController = ref.watch(authControllerProvider.notifier);

    useEffect(() {
      Future<void> run() async {
        await controller!.loadRequest(authController.loginUri!);
        pageState.value = false;
      }

      run();
      return () {
        //dispose
        controller = null;
      };
    });

    return Material(
      child: Scaffold(
        body: Stack(
          children: [
            WebViewWidget(controller: controller!),
            // ローディング時は全画面ブロック + CupertinoActivityIndicator を表示
            OverlayIndicator(show: pageState.value),
          ],
        ),
      ),
    );
  }

  Widget _buildWebView(WebViewState state, WebViewController controller) {
    if (state == WebViewState.pageLoaded) {
      return Material(
        child: Scaffold(
          body: Stack(children: [WebViewWidget(controller: controller)]),
        ),
      );
    }
    return Material(
      child: Center(
        child: Stack(
          children: [
            CircularProgressIndicator(),
            switch (state) {
              WebViewState.initiControler => const Text(
                'WebViewControllerの初期化中...',
              ),
              WebViewState.pageLoading => const Text('ページを読み込み中...'),
              _ => const SizedBox.shrink(),
            },
          ],
        ),
      ),
    );
  }
}
