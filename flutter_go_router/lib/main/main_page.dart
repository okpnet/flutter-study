import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/login/login_router.dart';
import 'package:flutter_go_router/providers/app_state_routing/app_state_routing.dart';
import 'package:flutter_go_router/providers/auth/auth_notifier.dart';
import 'package:flutter_go_router/providers/boot/startup.dart';
import 'package:flutter_go_router/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booting = ref.watch(startupProvider);
    ref.watch(appStateRoutingProvider);

    // 初期 push は build 完了後に行う
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   final loginState = await ref.read(authProvider.future);
    //   if (loginState != ExpiredStateType.enabled) {
    //     ref.read(routerProvider).push(loginPath);
    //   }
    // });

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
