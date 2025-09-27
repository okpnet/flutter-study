

import '../models/auth_state_model.dart';
import '../models/token_model.dart';
import '../pkce_authoricator.dart';
import 'token_provider.dart';

class PkceTokenProvider implements TokenProvider {
  final PkceAuthenticator authenticator;
  final AuthStateModel state;

  PkceTokenProvider({
    required this.authenticator,
    required this.state,
  });

  @override
  Future<TokenModel> getToken() async {
    if (!state.isAuthenticated) {
      await authenticator.login();
    }
    return state.token!;
  }

  @override
  bool get isTokenValid => state.isAuthenticated;

  @override
  Future<TokenModel?> refreshToken() async {
    // 実装次第で refresh_token を使う
    return null;
  }
}