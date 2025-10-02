import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GooglePage extends StatefulWidget {
    // initialize webview here !!
  const GooglePage({super.key});

  @override
  State<GooglePage> createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {
    // initialize webview here !!
final controller = WebViewController.fromPlatformCreationParams(
  const PlatformWebViewControllerCreationParams(),
)
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body:  WebViewWidget(controller: controller),
    );
  }
}