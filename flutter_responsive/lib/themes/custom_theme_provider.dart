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
  late final StateNotifierProvider<CustomThemeEventHandler,CustomTehemeModel> themeProvider;

  CustomThemeProvider(){
    themeProvider=StateNotifierProvider<CustomThemeEventHandler,CustomTehemeModel>((ref){
      return CustomThemeEventHandler();
    });
  }
  
  CustomTehemeModel getModel(WidgetRef ref){
    final provider=ref.watch(themeProvider.notifier);
    return provider.model;
  }

  void setLightTheme(WidgetRef ref)=>_changeThme(ref, ThemeMode.light);

  void setDarkThmeme(WidgetRef ref)=>_changeThme(ref, ThemeMode.dark);

  void setSystemTheme(WidgetRef ref)=>_changeThme(ref, ThemeMode.system);

  void _changeThme(WidgetRef ref,ThemeMode changedMode){
    final provider=ref.read(themeProvider.notifier);
    provider.changeTheme(changedMode);
  }
}