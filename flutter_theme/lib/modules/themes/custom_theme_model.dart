import 'package:flutter/material.dart';

class CustomThemeModel {
  late ThemeMode mode=ThemeMode.system;
  late ThemeData lightTheme=ThemeData.light();
  late ThemeData darkTheme=ThemeData.dark();

  CustomThemeModel({ThemeData? lightTheme, ThemeData? darkTheme,this.mode=ThemeMode.system}) {
    this.lightTheme = lightTheme ?? ThemeData.light();
    this.darkTheme = darkTheme ?? ThemeData.dark();
  }
}
