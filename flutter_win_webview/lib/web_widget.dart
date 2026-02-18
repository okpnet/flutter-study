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

    useEffect(() {
      Future<void> run() async {
        pageState.value = WebViewState.initiControler;
        try {
          await ref.watch(callBackServerProvider(port: DEFAULT_PORT).future);
          await controller!.clearCache();
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
              onProgress: (progress) => log('progress:$progress'),
            ),
          );
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
          children: [
            Center(
              child: switch (pageState.value) {
                WebViewState.initiControler => Column(
                  children: [
                    Transform.scale(
                      scale: 2.0, // ← ここで2倍に拡大
                      child: const CupertinoActivityIndicator(),
                    ),
                    const SizedBox(height: 16),
                    Text('初期化中...'),
                  ],
                ),
                WebViewState.pageLoading => Column(
                  children: [
                    Transform.scale(
                      scale: 2.0, // ← ここで2倍に拡大
                      child: const CupertinoActivityIndicator(),
                    ),
                    const SizedBox(height: 16),
                    Text('ページロード中...'),
                  ],
                ),
                WebViewState.none => Column(
                  children: [
                    Transform.scale(
                      scale: 2.0, // ← ここで2倍に拡大
                      child: const CupertinoActivityIndicator(),
                    ),
                    const SizedBox(height: 16),
                    Text('処理中...'),
                  ],
                ),
                _ => SizedBox.shrink(),
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class _WebWidgetState extends ConsumerState<WebWidget> {
//   @override
//   Widget build(BuildContext context) {
//     WebViewController? controller = WebViewController();
//     controller.setJavaScriptMode(JavaScriptMode.unrestricted);

//     final uriModel = ref.watch(authUriModelProvider);
//     return FutureBuilder(
//       future: (() async {
//         try {
//           await ref.watch(callBackServerProvider(port: DEFAULT_PORT).future);
//           await controller.clearCache();
//           await controller.loadRequest(uriModel.authorizationUrl);
//           return true;
//         } catch (e) {
//           log(e.toString());
//           return false;
//         }
//       })(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             appBar: AppBar(title: const Text('Web Widget')),
//             body: Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   CupertinoActivityIndicator(),
//                   SizedBox(height: 20),
//                   Text("Connecting keycloak..."),
//                 ],
//               ),
//             ),
//           );
//         }

//         if (snapshot.hasError) {
//           throw Exception('move errorpage');
//         }

//         return Scaffold(
//           appBar: AppBar(title: const Text('Web Widget')),
//           body: WebViewWidget(controller: controller),
//         );
//       },
//     );
//   }
// }
