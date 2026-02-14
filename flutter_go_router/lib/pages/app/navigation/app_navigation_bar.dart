import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppNavigationBar({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onDestinationSelected: _selectIndex,
    );
  }

  void _selectIndex(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
