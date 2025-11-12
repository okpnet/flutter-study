import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_mappable_test/options/custom_theme_option.dart';

part 'custom_theme_model.mapper.dart';

@MappableClass()
class CustomThemeModel with CustomThemeModelMappable {
  final bool isDark;
  CustomThemeOption selectedOption;

  CustomThemeModel({this.selectedOption=CustomThemeOption.system,this.isDark = false});
}
