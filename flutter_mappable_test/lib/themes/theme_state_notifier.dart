
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter_mappable_test/gen/assets.gen.dart';
import 'package:flutter_mappable_test/options/custom_theme_option.dart';
import 'package:flutter_mappable_test/themes/states/theme_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


final themeStateNotifierProvider =
    StateNotifierProvider<ThemeStateNotifier, ThemeState>(
        (ref) => ThemeStateNotifier(ThemeState.initial()));

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
  Future<void> initialize() async {
    final savedOption = await _readPreference();
    state = ThemeState(themePath: defaultThemePaths,selectedOption: savedOption);
    await state.changeTheme(savedOption);
  }

  ///テーマ適用
  Future<void> applyTheme(CustomThemeOption option) async {
    await state.changeTheme(option);
    await _writePreference(option);
    state = ThemeState(themePath: state.themePath, selectedOption: option);
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