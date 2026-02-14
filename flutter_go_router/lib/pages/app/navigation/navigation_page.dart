import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/app_navigation_bar.dart';
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
        body: navigationShell,
        bottomNavigationBar: AppNavigationBar(navigationShell: navigationShell),
      ),
    );
  }
}
