import 'package:flutter/material.dart';

//ページコントローラー
//ページの振り分けを行う
class PageControllerPage extends StatelessWidget {
  final Widget navigator;
  const PageControllerPage({super.key, required this.navigator});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopScope(canPop: false, child: Scaffold(body: navigator));
  }
}
