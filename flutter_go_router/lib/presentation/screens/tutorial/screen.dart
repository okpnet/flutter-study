import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_builder_sample/data/repositories/tutorial/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TutorialScreen extends ConsumerWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('チュートリアル')),
      body: Center(
        child: Column(
          spacing: 16,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('この画面では、アプリの使い方を説明します。まずはしめに ${'\n...' * 10}以上です！'),
            ),
            ElevatedButton(
              onPressed: () => ref.read(tutorialRepositoryProvider).checked(),
              child: const Text('チュートリアルを完了'),
            ),
          ],
        ),
      ),
    );
  }
}
