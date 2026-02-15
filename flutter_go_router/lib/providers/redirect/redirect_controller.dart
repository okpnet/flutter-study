import 'package:flutter_go_router/pages/login/login_router.dart';
import 'package:flutter_go_router/providers/auth/auth_notifier.dart';
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
    final authState = await ref.watch(authProvider.future);

    // ログインしているかどうかでリダイレクト先を決定
    if (authState != ExpiredStateType.enabled) {
      final location = _authGuard(fullPath);
      return location;
    }

    // ログインしている場合はリダイレクトしない
    return null;
  }

  String? _authGuard(String? fullPath) {
    // ログイン状態がFailの場合はLoginRouterへリダイレクト
    final loginPath = const LoginRouter().location;
    return loginPath != fullPath ? loginPath : null;
  }
}
