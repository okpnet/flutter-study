import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/app_router.dart';
import 'package:go_router/go_router.dart';

class AppNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppNavigationBar({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NavigationBar(
      selectedIndex: shellNavigatorKey.currentIndex,destinations: const) 
  }
}
