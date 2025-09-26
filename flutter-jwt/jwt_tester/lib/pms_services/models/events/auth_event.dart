import '../auth_state_model.dart';

abstract class AuthEvent {
  void apply(AuthStateModel state);
}