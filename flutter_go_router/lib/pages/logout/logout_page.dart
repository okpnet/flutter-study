import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/error/error_router.dart';
import 'package:flutter_go_router/pages/logout/scope_provider/timers.dart';
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

    useEffect(() {
      // Timer? tickTimer;
      // Timer? timeoutTimer;

      Future<void> run() async {
        try {
          // 経過秒カウント
          final tickTimer = ref.watch(customTimerProvider(1));
          tickTimer.periodicStart((t) {
            // t.tick は 1,2,3,... と増加
            seconds.value = t.tick;
          });
          final timeoutTimer = ref.watch(customTimerProvider(30));
          timeoutTimer.timer(() {
            if (!isProcessing.value) return; // 既に完了しているなら何もしない
            isProcessing.value = false;

            final ex = TimeoutException('ログアウトがタイムアウトしました（30秒）');
            // ErrorRouter での遷移
            _goError(ex, ref);
          });
          // tickTimer = Timer.periodic(const Duration(seconds: 1), (t) {
          //   // t.tick は 1,2,3,... と増加
          //   seconds.value = t.tick;
          // });

          // 30秒タイムアウト

          // timeoutTimer = Timer(const Duration(seconds: 30), () {
          //   if (!isProcessing.value) return; // 既に完了しているなら何もしない
          //   isProcessing.value = false;

          //   final ex = TimeoutException('ログアウトがタイムアウトしました（30秒）');
          //   // ErrorRouter での遷移
          //   _goError(ex, ref);
          // });

          // ログアウト実行（約6秒）
          await ref
              .read(authProvider.notifier)
              .changeState(ExpiredStateType.signedOut);

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
          // タイマーは必ず止める
          // if (timeoutTimer?.isActive ?? false) timeoutTimer!.cancel();
          // if (tickTimer?.isActive ?? false) tickTimer!.cancel();
        }
      }

      // ページ表示直後に開始
      run();

      // アンマウント時にタイマー停止
      // return () {
      //   if (timeoutTimer?.isActive ?? false) timeoutTimer!.cancel();
      //   if (tickTimer?.isActive ?? false) tickTimer!.cancel();
      // };
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
