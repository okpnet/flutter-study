import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_go_router/providers/auth/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("ログインページ"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  log("ログインボタンが押されました");
                  ref
                      .read(authProvider.notifier)
                      .changeState(ExpiredStateType.enabled);
                },
                child: const Text("ログイン"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
