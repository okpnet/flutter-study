import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/app_bttom_navbar.dart';
import 'package:flutter_go_router/pages/app/navigation/app_top_navbar.dart';
import 'package:go_router/go_router.dart';

class NavigationPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavigationPage({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: _createAppTopBar(),
        body: navigationShell,
        bottomNavigationBar: AppBottomNavbar(navigationShell: navigationShell),
      ),
    );
  }

  AppBar _createAppTopBar() {
    return AppBar(title: const Text('Test'));
  }
}
