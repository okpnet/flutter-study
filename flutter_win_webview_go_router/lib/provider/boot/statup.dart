import 'package:auther_controller/auth_controller.dart';
import 'package:flutter_win_webview_go_router/constants/constant_configure.dart';
import 'package:flutter_win_webview_go_router/provider/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'statup.g.dart';

@Riverpod(keepAlive: true)
Future<void> startup(Ref ref) async {
  await ref
      .read(authControllerProvider.notifier)
      .init(
        authUrlroot: ConstantConfigure.KEYCLOAK_URL,
        realms: ConstantConfigure.KEYCLOAK_RELMS,
        clientId: ConstantConfigure.KEYCLOAK_CLIENT_ID,
        redirectUrl: ConstantConfigure.KEYCLOAK_REDIRECT_URL,
        logger: Logger(),
      );
  ref.onDispose(() {
    ref.read(authControllerProvider.notifier).dispose();
  });
}
