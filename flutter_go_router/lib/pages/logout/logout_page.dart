import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/homes/details/detail_router.dart';
import 'package:flutter_go_router/providers/auth/auth_notifier.dart';
import 'package:flutter_go_router/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutPage extends ConsumerStatefulWidget {
  const LogoutPage({super.key});

  @override
  ConsumerState<LogoutPage> createState() => _LogoutPage();
}

class _LogoutPage extends ConsumerState<LogoutPage> {
  Timer? _timer;
  int _counter = 0;
  _LogoutPage();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (10 >= _counter) {
        _counter++;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.read(authProvider);
    return switch (authState) {
      AsyncError(:final error, :final stackTrace) => MaterialApp(
        home: Scaffold(body: Center(child: Text('Error:$error\n$stackTrace'))),
      ),
      AsyncData() => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("ログアウトページ"),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.home),
                onPressed: () {
                  log("ホームボタンが押されました");
                  ref.read(routerProvider).go(homeDetailpath);
                },
                label: const Text("ホーム"),
              ),
            ],
          ),
        ),
      ),
      _ => MaterialApp(
        home: const Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoActivityIndicator(),
                SizedBox(height: 20),
                Text("logout..."),
              ],
            ),
          ),
        ),
      ),
    };
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
