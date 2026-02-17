import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_router/providers/auth/auth_notifier.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState<bool>(false);
    final isMounted = context.mounted;

    Future<void> onLoginPressed() async {
      try {
        log("ログインボタンが押されました");
        isLoading.value = true;

        // ここは Future<void> を返します（ご指定どおり）
        await ref
            .read(authProvider.notifier)
            .changeState(ExpiredStateType.enabled);

        // ログイン完了後のページ遷移は Riverpod 側が自動で行う前提
      } catch (e, st) {
        log('ログイン処理でエラー: $e\n$st');
        // 必要であればエラー表示などを追加（仕様には未指定なのでここではログのみ）
      } finally {
        if (isMounted) {
          isLoading.value = false;
        }
      }
    }

    return Material(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("ログインページ"),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    onPressed: isLoading.value ? null : onLoginPressed,
                    label: const Text("ログイン"),
                  ),
                ],
              ),
            ),

            // ローディング時は全画面ブロック + CupertinoActivityIndicator を表示
            if (isLoading.value) ...[
              // 操作をブロック（タップ無効化）
              const ModalBarrier(
                dismissible: false,
                color: Colors.black26, // 半透明で操作不能を示す
              ),
              // 中央にインジケータ表示
              const Center(child: CupertinoActivityIndicator(radius: 16)),
            ],
          ],
        ),
      ),
    );
  }
}
