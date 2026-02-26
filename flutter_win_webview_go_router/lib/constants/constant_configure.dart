import 'package:flutter_win_webview_go_router/provider/auth/keycloak/model/keycloak_uri_model.dart';

final class ConstantConfigure {
  // ignore: constant_identifier_names
  static const int CALLBACK_SERVER_PORT = 45035;
  // ignore: non_constant_identifier_names
  static final KeycloakUriModel URI_MODEL = KeycloakUriModel.generate(
    keycloakUrl: 'https://qmspi.local:8443',
    //keycloakUrl: 'https://okp-04.local:8443',
    clientId: 'qual-app',
    realms: 'pms',
    redirectUri: 'http://127.0.0.1:45035/callback',
    scopes: const ['openid', 'profile', 'email'],
  );
}
