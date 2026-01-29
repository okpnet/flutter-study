//OAuth2.0 PKCE　エントリーインターフェイス
abstract interface class IAuthUriModel {
  static const String ENDPOINT_AUTH = "auth";
  static const String ENDPOINT_TOKEN = "token";
  static const String ENDPOINT_LOGOUT = "logout";

  // Authorization URL
  Uri get authorizationUrl;
  // Token URL
  Uri get tokenUrl;
  // Logout URL
  Uri get logoutUrl;
}
