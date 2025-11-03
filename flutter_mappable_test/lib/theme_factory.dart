import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'custom_theme_option.dart';
import 'gen/assets.gen.dart';
class ThemeFactory {

  static Future<ThemeData> createLightThemeData(CustomThemeOption option) async {
    return switch(option){
      CustomThemeOption.pink => await generateFromAssets(Assets.themes.themePink),
      CustomThemeOption.blue => await generateFromAssets(Assets.themes.themeBlue),
      CustomThemeOption.green => await generateFromAssets(Assets.themes.themeGreen),
      _=>ThemeData.light(),
    };
  }

  static Future<ThemeData> createDarkThemeData(CustomThemeOption option) async {
    return switch(option){
      CustomThemeOption.pink => await generateFromAssets(Assets.themes.themePink),
      CustomThemeOption.blue => await generateFromAssets(Assets.themes.themeBlue),
      CustomThemeOption.green => await generateFromAssets(Assets.themes.themeGreen),
      _=>ThemeData.dark(),
    };
  }

  static Future<ThemeData> generateFromAssets(String path) async{
      final jsonStr=await rootBundle.loadString(path);
      final jsonMap=jsonDecode(jsonStr);
      final result=ThemeDecoder.decodeThemeData(jsonMap)!;
      return result;
  }
}