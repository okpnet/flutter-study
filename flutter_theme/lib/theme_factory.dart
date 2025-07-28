import 'package:flutter/material.dart';

class ThemeFactory 
{
  static final ThemeFactory _instance=ThemeFactory._internal();

  factory ThemeFactory()=>_instance;

  ThemeFactory._internal(){

  }

  ThemeData darkTheme(){
    return ThemeData.dark().copyWith(
      primaryColor: Colors.green
    );
  }

  ThemeData lightTheme(){
    return ThemeData.light().copyWith(
      primaryColor: Colors.brown
    );
  }
}