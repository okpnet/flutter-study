import 'auth_event.dart';
import '../auth_state_model.dart';

class AuthExpiredEvent implements AuthEvent {
  @override
  void apply(AuthStateModel state) {
    state.token = null;
    // PKCEは保持（再認証で更新される）
  }
}