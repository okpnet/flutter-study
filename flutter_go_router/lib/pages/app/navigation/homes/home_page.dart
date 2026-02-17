import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/homes/details/detail_router.dart';
import 'package:flutter_go_router/pages/shared_controlls/shared_logout_button.dart';
import 'package:flutter_go_router/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

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
                  .read(routerProvider)
                  .pushNamed(homeDetailName, pathParameters: {'id': '123'});
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
