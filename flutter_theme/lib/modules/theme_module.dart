import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_theme/modules/themes/custom_theme_model.dart';


class ThemeModule {
  //CustomThemeModel _model = CustomThemeModel();

  late StateProvider<ThemeMode> stateProvider = StateProvider<ThemeMode>((ref){
    final model= ref.watch(themeModelProvider);
    return model.mode;
  });
  late StateProvider<CustomThemeModel> themeModelProvider= StateProvider<CustomThemeModel>((ref)=>CustomThemeModel());

  String getModeNam(WidgetRef ref){
    final model= ref.watch(themeModelProvider);
    return model.mode.toString();
  }

  //ThemeMode getMode(WidgetRef ref)=>ref.watch(stateProvider);

  void changeStateToSystemMode(WidgetRef ref)=>_changeMode(ref: ref, mode: ThemeMode.system);

  void changeStateToLightMode(WidgetRef ref)=>_changeMode(ref: ref, mode: ThemeMode.light);

  void changeStateToDarkMode(WidgetRef ref)=>_changeMode(ref: ref, mode: ThemeMode.dark);

  void _changeMode({required WidgetRef ref,required ThemeMode mode}){//=>ref.read(stateProvider.notifier).state=mode;
    final model= ref.watch(themeModelProvider);
    model.mode=mode;
    ref.read(themeModelProvider.notifier).state=model;
    ref.read(stateProvider.notifier).state=mode;
  }
}