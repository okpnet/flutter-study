import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_win_webview/providers/auth_providers/callback_server.dart';
import 'package:flutter_win_webview/providers/inialize.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum WebViewState { none, initiControler, pageLoading, pageLoaded }

class WebWidget extends HookConsumerWidget {
  const WebWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebViewController? controller = useMemoized(() => WebViewController());
    controller!.setJavaScriptMode(JavaScriptMode.unrestricted);

    final uriModel = ref.watch(authUriModelProvider);
    final pageState = useState<WebViewState>(WebViewState.none);
    ref.watch(callBackServerProvider(port: DEFAULT_PORT).future);
    useEffect(() {
      Future<void> run() async {
        pageState.value = WebViewState.initiControler;
        try {
          //await controller!.clearCache();
          await ref
              .watch(callBackServerProvider(port: DEFAULT_PORT).future)
              .whenComplete(() async {
                await controller!.loadRequest(uriModel.authorizationUrl);
                await controller!.setNavigationDelegate(
                  NavigationDelegate(
                    onPageStarted: (url) {
                      log('loading:$url');
                      pageState.value = WebViewState.pageLoading;
                    },
                    onPageFinished: (url) {
                      log('loading:$url');
                      pageState.value = WebViewState.pageLoaded;
                    },
                    onHttpError: (error) =>
                        log('HTTP Errorerror:${error.toString()}'),
                    //onProgress: (progress) => log('progress:$progress'),
                  ),
                );
              });
        } catch (e) {
          log(e.toString());
        }
      }

      run();
      return () {
        log('dispose');
        controller = null;
      };
    }, []);
    return Scaffold(
      appBar: AppBar(title: const Text('Web Widget')),
      body: Center(
        child: Stack(
          //ColumnにするとWebViewは機能しない。表示しない。
          alignment: Alignment.center,
          children: [
            WebViewWidget(controller: controller!),
            if (pageState.value != WebViewState.pageLoaded)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, //高さ方向（Columnなので当然）で最小にすると、親のCenterが効いて、上下中央に配置される。
                  children: [
                    Transform.scale(
                      scale: 2.0, // ← ここで2倍に拡大
                      child: const CupertinoActivityIndicator(),
                    ),
                    const SizedBox(height: 16),
                    switch (pageState.value) {
                      WebViewState.initiControler => const Text('初期化中...'),
                      WebViewState.pageLoading => const Text('ページ読み込み中...'),
                      _ => SizedBox.shrink(),
                    },
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
