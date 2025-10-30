import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_theme_model.freezed.dart';
part 'custom_theme_model.g.dart';

@freezed
abstract class CustomThemeModel with _$CustomThemeModel {
  factory CustomThemeModel({
    required String themeName,
    required bool isDarkMode,
  }) = _CustomThemeModel;

  factory CustomThemeModel.fromJson(Map<String, dynamic> json) =>
      _$CustomThemeModelFromJson(json);
}