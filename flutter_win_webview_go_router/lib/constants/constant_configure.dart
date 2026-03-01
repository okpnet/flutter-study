final class ConstantConfigure {
  // ignore: constant_identifier_names
  // static const int CALLBACK_SERVER_PORT = 45035;
  // ignore: non_constant_identifier_names
  // static const String KEYCLOAK_URL = 'https://qmspi.local:8443';
  static const String KEYCLOAK_URL = 'https://okp-04.local:8443';
  static const String KEYCLOAK_CLIENT_ID = 'qual-app';
  static const String KEYCLOAK_RELMS = 'pms';
  static const String KEYCLOAK_REDIRECT_URL = 'http://127.0.0.1:45035/callback';
  static const List<String> KEYCLOAK_SOCPES = ['openid', 'profile', 'email'];
}
