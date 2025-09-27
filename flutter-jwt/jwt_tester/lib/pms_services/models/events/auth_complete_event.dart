import 'auth_event.dart';
import '../auth_state_model.dart';
import '../token_model.dart';

class AuthCompleteEvent extends AuthEvent {

  AuthCompleteEvent(TokenModel token, AuthStateModel state) : super(state) {
    state.token = token;
  }
}