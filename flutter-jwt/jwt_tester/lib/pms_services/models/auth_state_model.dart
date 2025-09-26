import 'pkce_model.dart';
import 'token_model.dart';
import 'events/auth_event.dart';

class AuthStateModel {
  PKCEModel pkce;
  TokenModel? token;

  AuthStateModel({required this.pkce, this.token});

  bool get isAuthenticated => token != null && !token!.isExpired;

  void applyEvent(AuthEvent event) =>event.apply(this);
}