import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:pms_authenticator/auth_controller.dart';

enum WebViewState { none, initiControler, pageLoading, pageLoaded }

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = useState<WebViewState>(WebViewState.none);
    WebViewController? controller = useMemoized(() => WebViewController());
    controller!.setJavaScriptMode(JavaScriptMode.unrestricted);
    final authController = ref.watch(authControllerProvider.notifier);

    useEffect(() {
      controller!.setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            log('onPageStarted: $url');
            pageState.value = WebViewState.pageLoading;
          },
          onPageFinished: (url) {
            log('onPageFinished: $url');
            pageState.value = WebViewState.pageLoaded;
          },
          onWebResourceError: (error) {
            log('onWebResourceError: ${error.description}');
            pageState.value = WebViewState.none;
          },
        ),
      );
      Future<void> run() async {
        pageState.value = WebViewState.initiControler;
        await controller!.loadRequest(authController.loginUri!);
      }

      run();
      return null;
      // return () {
      //   //dispose
      //   controller = null;
      // };
    }, []);

    return _buildWebView(pageState.value, controller!);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 処理中インジケータ
            CupertinoActivityIndicator(),
            SizedBox(height: 20),
            switch (state) {
              WebViewState.initiControler => const Text('WEB initialize...'),
              WebViewState.pageLoading => const Text('loading...'),
              _ => const Text('initialize...'),
            },
          ],
        ),
      ),
    );
  }
}
