import 'package:dart_mappable/dart_mappable.dart';

part 'custom_theme_model.mapper.dart';

@MappableClass()
class CustomThemeModel with CustomThemeModelMappable {
  final bool isDark;

  CustomThemeModel({this.isDark = false});
}
