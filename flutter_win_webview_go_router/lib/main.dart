import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_win_webview_go_router/pages/splash_screen/splash_screen_page.dart';
import 'package:flutter_win_webview_go_router/provider/boot/statup.dart';
import 'package:flutter_win_webview_go_router/provider/router/root_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(overrides: [], child: const MainApp()));
}

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInitilaize = useState<bool>(false);

    useEffect(() {
      Future<void> run() async {
        //テスト待機
        await Future.delayed(Duration(seconds: 5));
        await ref
            .read(startupProvider.future)
            .whenComplete(() => isInitilaize.value = true);
      }

      //初期化
      run();
      return () {};
    });
    return isInitilaize.value
        ? MaterialApp.router(routerConfig: ref.read(rootRouterProvider))
        : SplashScreenPage();
  }
}
