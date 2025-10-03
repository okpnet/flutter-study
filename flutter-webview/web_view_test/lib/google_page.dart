import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GooglePage extends StatefulWidget {
    // initialize webview here !!
  const GooglePage({super.key});

  @override
  State<GooglePage> createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {
    // initialize webview here !!
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InAppWebView')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.parse('https://flutter.dev')),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
      ),
    );
  }
}