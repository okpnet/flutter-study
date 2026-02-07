import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_app/data/repositories/auth_repository.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            ElevatedButton(
              onPressed: () => ref.read(authRepositoryProvider).login(),
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async =>
                  ref.read(maintenanceRepositoryProvider).setMaintenanceMode(),
              child: const Text('５秒で解除されるメンテナンスを発動'),
            ),
          ],
        ),
      ),
    );
  }
}
