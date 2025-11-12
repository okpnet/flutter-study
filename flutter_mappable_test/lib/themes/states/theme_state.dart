import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mappable_test/options/custom_theme_option.dart';
import 'package:flutter_mappable_test/theme_factory.dart';
import 'package:flutter_mappable_test/themes/pairs/pair_theme_data.dart';

part 'theme_state.mapper.dart';

@MappableClass()
class ThemeState with ThemeStateMappable {
  PairThemeData currentThemeData=PairThemeData(
    light: ThemeData.light(),
     dark: ThemeData.dark()
     );

  CustomThemeOption selectedOption=CustomThemeOption.system;

  PairThemeData get currentTheme => currentThemeData;

  Map<CustomThemeOption,String> themePath;

  ThemeState({required this.themePath});

  Future<void> changeTheme(CustomThemeOption option) async{
    selectedOption=option;
    currentThemeData= await ThemeFactory.createThemeData(option);
  }
}