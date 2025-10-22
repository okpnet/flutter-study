import 'package:flutter/material.dart';
import 'package:flutter_responsive/themes/custom_teheme_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class CustomThemeProvider {
  late final StateProvider<CustomTehemeModel> themeProvider;

  CustomThemeProvider(){
    themeProvider=StateProvider<CustomTehemeModel>((ref){
      final model= CustomTehemeModel();
      return model;
    });
  }

  CustomTehemeModel getModel(WidgetRef ref){
    final themeModel=ref.watch<CustomTehemeModel>(themeProvider);
    return themeModel;
  }

  void setLightTheme(WidgetRef ref)=>_changeThme(ref, ThemeMode.light);

  void setDarkThmeme(WidgetRef ref)=>_changeThme(ref, ThemeMode.dark);

  void setSystemTheme(WidgetRef ref)=>_changeThme(ref, ThemeMode.system);

  void _changeThme(WidgetRef ref,ThemeMode changedMode){
    final themeModel=ref.read<CustomTehemeModel>(themeProvider);
    ref.read(themeProvider.notifier).state=CustomTehemeModel(model)
    themeModel.mode=changedMode;
  }
}