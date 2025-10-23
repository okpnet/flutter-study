import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_theme/modules/themes/custom_theme_model.dart';

class ThemeModule {
  final CustomThemeModel _model = CustomThemeModel();

  StateProvider<ThemeMode> get stateProvider => StateProvider<ThemeMode>((ref) => _model.mode);
  StateProvider<CustomThemeModel> get themeModelProvider => StateProvider<CustomThemeModel>((ref)=>_model);

  ThemeMode getMode(WidgetRef ref)=>ref.watch(stateProvider);

  void changeStateToSystemMode(WidgetRef ref)=>_changeMode(ref: ref, mode: ThemeMode.system);

  void changeStateToLightMode(WidgetRef ref)=>_changeMode(ref: ref, mode: ThemeMode.light);

  void changeStateToDarkMode(WidgetRef ref)=>_changeMode(ref: ref, mode: ThemeMode.dark);
  
  void _changeMode({required WidgetRef ref,required ThemeMode mode})=>ref.read(stateProvider.notifier).state=mode;
}