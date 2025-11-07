
import 'package:flutter_mappable_test/themes/states/theme_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeStateNotifier extends StateNotifier<ThemeState> {
  ThemeStateNotifier(super.state);
  Future<void> changeTheme(ThemeState newState) async {
    state = newState;
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setString('themeOption', newState.selectedOption.toString());
    });
  }
}