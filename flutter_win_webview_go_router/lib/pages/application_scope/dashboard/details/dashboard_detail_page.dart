import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview_go_router/pages/_shared/buttons/shared_logout_button.dart';
import 'package:flutter_win_webview_go_router/provider/router/root_router.dart';

class DashboardDetailPage extends ConsumerWidget {
  final String id;
  const DashboardDetailPage({required this.id, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("ホーム詳細"),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Icon(Icons.back_hand),
            onPressed: () {
              log("戻るが押されました");
              ref.read(rootRouterProvider).pop();
            },
            label: const Text("戻る"),
          ),
          const SizedBox(height: 20),
          SharedLogoutButton(),
        ],
      ),
    );
  }
}
