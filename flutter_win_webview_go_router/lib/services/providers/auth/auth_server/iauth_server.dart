abstract interface class IAuthServer {
  Future<void> refreshToken();
  Future<void> login({String? code});
  Future<void> logout();
}
