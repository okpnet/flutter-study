// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'custom_theme_option.dart';

class CustomThemeOptionMapper extends EnumMapper<CustomThemeOption> {
  CustomThemeOptionMapper._();

  static CustomThemeOptionMapper? _instance;
  static CustomThemeOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomThemeOptionMapper._());
    }
    return _instance!;
  }

  static CustomThemeOption fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CustomThemeOption decode(dynamic value) {
    switch (value) {
      case r'system':
        return CustomThemeOption.system;
      case r'pink':
        return CustomThemeOption.pink;
      case r'blue':
        return CustomThemeOption.blue;
      case r'green':
        return CustomThemeOption.green;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CustomThemeOption self) {
    switch (self) {
      case CustomThemeOption.system:
        return r'system';
      case CustomThemeOption.pink:
        return r'pink';
      case CustomThemeOption.blue:
        return r'blue';
      case CustomThemeOption.green:
        return r'green';
    }
  }
}

extension CustomThemeOptionMapperExtension on CustomThemeOption {
  String toValue() {
    CustomThemeOptionMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CustomThemeOption>(this) as String;
  }
}

