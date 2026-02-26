import 'package:auther_controller/auth_controller.dart';
import 'package:flutter_win_webview_go_router/provider/auth/keycloak/init_keycloak/keycloak_auth.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/authenticate/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initialize.g.dart';

@Riverpod(keepAlive: true)
Future<void> initilalize(Ref ref) async {
  ref.read(authenticationProvider);
  ref.read(keycloakAuthProvider);

  await ref
      .read(authControllerProvider.notifier)
      .init(
        authUrlroot: 'https://qmspi.local:8443',
        // authUrlroot: 'https://okp-04.local:8443',
        realms: 'pms',
        clientId: "qual-app",
        redirectUrl: 'http://127.0.0.1:45035/callback',
      );
}
