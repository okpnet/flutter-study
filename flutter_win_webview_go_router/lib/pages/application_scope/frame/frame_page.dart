import 'package:flutter/material.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/frame/navigationbars/bottom_bar_content.dart';
import 'package:go_router/go_router.dart';

class FramePage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const FramePage({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: _createAppTopBar(),
        body: navigationShell,
        bottomNavigationBar: BottomBarContent(navigationShell: navigationShell),
      ),
    );
  }

  AppBar _createAppTopBar() {
    return AppBar(title: const Text('Test'));
  }
}
