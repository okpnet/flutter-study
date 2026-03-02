import 'package:flutter_win_webview_go_router/constants/constant_configure.dart';
import 'package:flutter_win_webview_go_router/logging/my_logger.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/dashboard/root/dashboard_router.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/error/error_router.dart';
import 'package:flutter_win_webview_go_router/pages/generarl_scope/logout/logout_router.dart';
import 'package:flutter_win_webview_go_router/provider/router/root_router.dart';
import 'package:pms_authenticator/auth_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'statup.g.dart';

@Riverpod(keepAlive: true)
Future<void> startup(Ref ref) async {
  //テスト待機
  await Future.delayed(Duration(seconds: 5));
  await ref
      .read(authControllerProvider.notifier)
      .init(
        authUrlroot: ConstantConfigure.KEYCLOAK_URL,
        realms: ConstantConfigure.KEYCLOAK_RELMS,
        clientId: ConstantConfigure.KEYCLOAK_CLIENT_ID,
        redirectUrl: ConstantConfigure.KEYCLOAK_REDIRECT_URL,
        logger: MyLogger(),
      );
  ref.listen(authControllerProvider, (prev, next) {
    final router = ref.read(rootRouterProvider);
    switch (next) {
      case AuthStateType.fail:
        router.go(ErrorConstant.path);
        break;
      case AuthStateType.authenticated:
        if (prev != AuthStateType.signedOut) {
          return;
        }
        if (router.canPop()) {
          router.pop();
        } else {
          router.go(DashboradConstant.path);
        }
        break;
      case AuthStateType.signedOut:
        router.go(LogoutConstant.path);
        break;
      default:
        return;
    }
  });
  ref.onDispose(() {
    ref.read(authControllerProvider.notifier).dispose();
  });
}
