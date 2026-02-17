import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/error/error_router.dart';
import 'package:flutter_go_router/providers/auth/auth_notifier.dart';
import 'package:flutter_go_router/router/router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogoutPage extends HookConsumerWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seconds = useState<int>(0);
    final isProcessing = useState<bool>(true);
    final isMounted = context.mounted;

    Timer? counterTimer;
    Timer? timeoutTimer;

    void dispose() {
      counterTimer?.cancel();
      timeoutTimer?.cancel();
    }

    useEffect(() {
      Future<void> run() async {
        try {
          counterTimer = Timer.periodic(const Duration(seconds: 1), (t) {
            // t.tick は 1,2,3,... と増加
            seconds.value = t.tick;
            log('カウント:${seconds.value}');
          });

          timeoutTimer = Timer(const Duration(seconds: 30), () {
            if (!isProcessing.value) return; // 既に完了しているなら何もしない
            isProcessing.value = false;

            final ex = TimeoutException('ログアウトがタイムアウトしました（30秒）');
            // ErrorRouter での遷移
            _goError(ex, ref);
          });
          // await Future.delayed(const Duration(seconds: 60));
          await ref
              .read(authProvider.notifier)
              .changeState(ExpiredStateType.signedOut)
              .whenComplete(() {
                //ここでタイマーは停止する
                //dispose();
                log('logout timer dispose');
              });

          // 成功: Riverpod側で遷移する想定。ここでは状態更新のみ。
          if (isMounted) {
            isProcessing.value = false;
          }
        } catch (e, st) {
          // 失敗: エラー画面へ
          final ex = e is Exception ? e : Exception(e.toString());
          if (isMounted) {
            isProcessing.value = false;
            _goError(ex, ref);
          }
        } finally {
          // ここでタイマーは停止する
          dispose();
          log('finally timer stoped');
        }
      }

      // ページ表示直後に開始
      run();

      return () {
        // ここでタイマーは止まらない
        //dispose();
        log('return tyimer stoped');
      };
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('ログアウト中…')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 処理中インジケータ
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            // 経過秒表示
            Text('${seconds.value}秒経過しました'),
            const SizedBox(height: 8),
            Text(
              isProcessing.value
                  ? 'ログアウト処理を実行中です。最大30秒かかる場合があります。'
                  : '処理が完了しました。',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  /// ErrorRouter を使ってエラー画面へ遷移
  /// ※ ErrorRouter の実際のAPIに合わせて適宜修正してください。
  void _goError(Exception ex, WidgetRef ref) {
    ref.read(routerProvider).go(errorPath, extra: ex);
  }
}
