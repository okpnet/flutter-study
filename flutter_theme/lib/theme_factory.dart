import 'package:flutter/material.dart';

class ThemeFactory 
{
  static final ThemeFactory _instance=ThemeFactory._internal();

  factory ThemeFactory()=>_instance;

  ThemeFactory._internal();

  ThemeData darkTheme(){
    return ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.dark,
      useMaterial3: false
    );
  }

  ThemeData lightTheme(){
    return ThemeData(
      primarySwatch: Colors.brown,
      brightness: Brightness.light,
      useMaterial3: false
    );
  }
}