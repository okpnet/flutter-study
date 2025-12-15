import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

class WebWidget extends StatefulWidget {
  const WebWidget({super.key});

  @override
  State<WebWidget> createState() => _WebWidgetState();
}

class _WebWidgetState extends State<WebWidget> {
  final WebviewController _controller = WebviewController();

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  Future<void> _initializeWebView() async {
    await _controller.initialize();
    await _controller.loadUrl('https://www.google.com');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web Widget')),
      body: _controller.value.isInitialized
          ? Webview(_controller)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
