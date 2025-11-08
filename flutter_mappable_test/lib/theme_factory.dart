import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mappable_test/themes/pairs/pair_theme_data.dart';
import 'package:json_theme/json_theme.dart';
import 'options/custom_theme_option.dart';
import 'gen/assets.gen.dart';
class ThemeFactory {

  static Future<PairThemeData> createThemeData(CustomThemeOption option) async {
    switch(option){
      case CustomThemeOption.pink:
        final pinkTheme=await generateFromAssets(Assets.themes.themePink);
        return PairThemeData(
          light: pinkTheme,
          dark: pinkTheme,
        );
        case CustomThemeOption.blue:
        final blueTheme=await generateFromAssets(Assets.themes.themeBlue);
        return PairThemeData(
          light: blueTheme,
          dark: blueTheme,
        );
      case CustomThemeOption.green:
        final greenTheme=await generateFromAssets(Assets.themes.themeGreen);
        return PairThemeData(
          light: greenTheme,
          dark: greenTheme,
        );
      default:
        return PairThemeData(
          light: ThemeData.light(),
          dark: ThemeData.dark(),
        );
    }
  }

  static Future<ThemeData> generateFromAssets(String path) async{
      final jsonStr=await rootBundle.loadString(path);
      final jsonMap=jsonDecode(jsonStr);
      final result=ThemeDecoder.decodeThemeData(jsonMap)!;
      return result;
  }
}