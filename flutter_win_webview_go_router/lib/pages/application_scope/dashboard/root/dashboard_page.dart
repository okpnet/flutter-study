import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview_go_router/pages/_shared/buttons/shared_logout_button.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/dashboard/details/dashboard_detail_router.dart';
import 'package:flutter_win_webview_go_router/provider/router/root_router.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("ホーム"),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Icon(Icons.details),
            onPressed: () {
              log("詳細が押されました");
              ref
                  .read(rootRouterProvider)
                  .pushNamed(
                    DashboardDetailConstant.path,
                    pathParameters: {'id': '123'},
                  );
              //DetailRouter(id: '123').push(context);
            },
            label: const Text("詳細"),
          ),
          const SizedBox(height: 20),
          SharedLogoutButton(),
        ],
      ),
    );
  }
}
