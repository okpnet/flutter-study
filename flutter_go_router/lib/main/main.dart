import 'package:flutter/material.dart';
import 'package:flutter_go_router/main/main_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainPage()));
}
