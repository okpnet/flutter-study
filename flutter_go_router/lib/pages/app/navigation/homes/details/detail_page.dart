import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_go_router/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final String id;
  const DetailPage({required this.id, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top Page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("ホーム詳細"),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.back_hand),
              onPressed: () {
                log("戻るが押されました");
                ref.read(routerProvider).pop();
              },
              label: const Text("戻る"),
            ),
          ],
        ),
      ),
    );
  }
}
