import 'package:flutter_go_router/pages/login/login_router.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'redirect_controller.g.dart';

@Riverpod(keepAlive: true)
RedirectController redirectController(Ref ref) => RedirectController(ref: ref);

class RedirectController {
  final Ref ref;

  const RedirectController({required this.ref});

  FutureOr<String?> call(GoRouterState state) async {
    final fullPath = state.fullPath;
    // メンテナンスモードの状態を取得
    // final isMaintenanceMode = await ref.read(isMaintenanceModeProvider.future);

    // メンテナンスモードの場合はメンテナンス画面へリダイレクト
    // if (isMaintenanceMode) return _maintenanceGuard(fullPath);

    // ログイン状態を取得
    // final isLoggedIn = await ref.read(isLoggedInProvider.future);

    // ログインしているかどうかでリダイレクト先を決定
    // if (isLoggedIn) return _authGuard(fullPath);

    // ログインしていない場合のリダイレクト処理
    return _noAuthGuard(fullPath);
  }

  String? _noAuthGuard(String? fullpath) {
    final loginPath = const LoginRouter().location;
    return loginPath != fullpath ? loginPath : null;
  }
}
