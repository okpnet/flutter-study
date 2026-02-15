import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_router/providers/boot/startup.dart';
import 'package:flutter_go_router/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booting = ref.watch(startupProvider);

    return switch (booting) {
      AsyncError(:final error, :final stackTrace) => MaterialApp(
        home: Scaffold(body: Center(child: Text('Error:$error\n$stackTrace'))),
      ),
      AsyncData() => MaterialApp.router(routerConfig: ref.read(routerProvider)),
      _ => MaterialApp(
        home: const Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoActivityIndicator(),
                SizedBox(height: 20),
                Text("wait..."),
              ],
            ),
          ),
        ),
      ),
    };
  }
}
