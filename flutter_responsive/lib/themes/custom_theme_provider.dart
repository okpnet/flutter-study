import 'package:flutter/material.dart';
import 'package:flutter_responsive/themes/custom_teheme_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class CustomThemeEventHandler extends StateNotifier<CustomTehemeModel>{
  CustomThemeEventHandler():super(CustomTehemeModel());
  CustomTehemeModel get model=>state;

  void changeTheme(ThemeMode changedMode){
    state.mode=changedMode;
    state=CustomTehemeModel(mode: changedMode);
  }
}

class CustomThemeProvider {
  
  static CustomTehemeModel getModel(WidgetRef ref)=>ref.watch(CustomThemeProvider.themeProvider);
  
  static final themeProvider=StateNotifierProvider<CustomThemeEventHandler,CustomTehemeModel>((ref)=>CustomThemeEventHandler());

  static ThemeMode watchMode(WidgetRef ref)=>ref.watch(themeProvider.select((theme)=>theme.mode));

  static void setLightTheme(WidgetRef ref)=>_changeThme(ref, ThemeMode.light);

  static void setDarkThmeme(WidgetRef ref)=>_changeThme(ref, ThemeMode.dark);

  static void setSystemTheme(WidgetRef ref)=>_changeThme(ref, ThemeMode.system);

  static void _changeThme(WidgetRef ref,ThemeMode changedMode){
    final provider=ref.read(themeProvider.notifier);
    provider.changeTheme(changedMode);
  }
}