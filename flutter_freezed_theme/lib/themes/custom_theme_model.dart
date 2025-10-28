import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'custom_theme_model.freezed.dart';
part 'custom_theme_model.g.dart';

@freezed
class CustomThemeModel with _$CustomThemeModel{
  const factory CustomThemeModel({
    @Default(ThemeMode.system) required ThemeMode mode,
  })= _CustomThemeModel;

  factory CustomThemeModel.fromJson(Map<String,dynamic> json)=>_$CustomThemeModel(json);
}