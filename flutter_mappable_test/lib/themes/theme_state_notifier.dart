import 'package:flutter_mappable_test/gen/assets.gen.dart';
import 'package:flutter_mappable_test/options/custom_theme_option.dart';
import 'package:flutter_mappable_test/themes/states/theme_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeStateNotifierProvider =
    StateNotifierProvider<ThemeStateNotifier, ThemeState>(
      (ref) => ThemeStateNotifier(ThemeState.initial()),
    );

class ThemeStateNotifier extends StateNotifier<ThemeState> {
  /// デフォルトのテーマパス
  Map<CustomThemeOption, String> defaultThemePaths = {
    CustomThemeOption.pink: Assets.themes.themePink,
    CustomThemeOption.blue: Assets.themes.themeBlue,
    CustomThemeOption.green: Assets.themes.themeGreen,
    CustomThemeOption.system: '',
  };

  ThemeStateNotifier(super.state);

  ///初期化
  ///FutureBuilderで使用。戻り値がないとsnapshot.hasDataがtrueにならないためboolを返す
  Future<bool> initialize() async {
    try {
      final savedOption = await _readPreference();
      if (savedOption == state.selectedOption) {
        // 保存されているテーマと現在のテーマが同じ場合は何もしない
        return true;
      }

      state = state.copyWith(selectedOption: savedOption);
      await state.changeTheme(savedOption);
      await _writePreference(savedOption);
      return true;
    } catch (e) {
      // エラー処理（必要に応じて）
      return false;
    }
  }

  ///テーマ適用
  Future<void> applyTheme(CustomThemeOption option) async {
    state = state.copyWith(selectedOption: option);
    await state.changeTheme(option);
    await _writePreference(option);
    await Future.delayed(Duration(seconds: 2)); // 状態更新を待つ
  }

  /// 設定の保存
  Future<void> _writePreference(CustomThemeOption option) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeOption', option.toString());
  }

  /// 設定から読み込み
  Future<CustomThemeOption> _readPreference() async {
    final prefs = await SharedPreferences.getInstance();
    final themeOptionString = prefs.getString('themeOption');
    return CustomThemeOption.values.firstWhere(
      (e) => e.toString() == themeOptionString,
      orElse: () => CustomThemeOption.system,
    );
  }
}
