import 'auth_event.dart';
import '../auth_state_model.dart';
import '../token_model.dart';

class AuthCompleteEvent implements AuthEvent {
  final TokenModel token;

  AuthCompleteEvent(this.token);

  @override
  void apply(AuthStateModel state) {
    state.token = token;
    // PKCEはそのまま
  }
}