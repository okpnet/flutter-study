abstract interface class AuthUriModel {
  Future<void> refreshToken();
  Future<void> login();
  Future<void> logout();
}
