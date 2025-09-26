import 'auth_event.dart';
import '../auth_state_model.dart';
import '../pkce_model.dart';

class AuthStartEvent implements AuthEvent {
  @override
  void apply(AuthStateModel state) {
    state.token = null;
    state.pkce = PKCEModel.generate();
  }
}