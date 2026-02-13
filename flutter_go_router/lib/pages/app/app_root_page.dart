import 'package:flutter/material.dart';

class AppRootPage extends StatelessWidget {
  final Widget navigator;
  const AppRootPage({super.key, required this.navigator});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopScope(canPop: false, child: Scaffold(body: navigator));
  }
}
