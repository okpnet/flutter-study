import 'package:flutter/material.dart';
import 'package:webview_win_floating/webview_win_floating.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebWidget extends StatefulWidget {
  const WebWidget({super.key});

  @override
  State<WebWidget> createState() => _WebWidgetState();
}

class _WebWidgetState extends State<WebWidget> {
  final _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (req) {
            final uri = Uri.parse(req.url);
            if (uri.scheme == 'myapp' && uri.host == 'callback') {
              final code = uri.queryParameters['code'];
              if (code != null) {
                // Handle the authorization code
                print('Authorization code: $code');
                return NavigationDecision.prevent;
              }
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    _controller.loadRequest(
      Uri.parse(
        'https://qmspi.local:8443/realms/pms/protocol/openid-connect/auth',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web Widget')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
