import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_win_webview/providers/inialize.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebWidget extends ConsumerStatefulWidget {
  const WebWidget({super.key});

  @override
  ConsumerState<WebWidget> createState() => _WebWidgetState();
}

class _WebWidgetState extends ConsumerState<WebWidget> {
  @override
  Widget build(BuildContext context) {
    WebViewController? controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);

    final uriModel = ref.watch(authUriModelProvider);
    return FutureBuilder(
      future: (() async {
        try {
          await controller.clearCache();
          await controller.loadRequest(uriModel.authorizationUrl);
          return true;
        } catch (e) {
          log(e.toString());
          return false;
        }
      })(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: const Text('Web Widget')),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoActivityIndicator(),
                  SizedBox(height: 20),
                  Text("Connecting keycloak..."),
                ],
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          throw Exception('move errorpage');
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Web Widget')),
          body: WebViewWidget(controller: controller!),
        );
      },
    );
  }
}
