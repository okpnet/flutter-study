// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_state_type.dart';

class AuthStateTypeMapper extends EnumMapper<AuthStateType> {
  AuthStateTypeMapper._();

  static AuthStateTypeMapper? _instance;
  static AuthStateTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthStateTypeMapper._());
    }
    return _instance!;
  }

  static AuthStateType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AuthStateType decode(dynamic value) {
    switch (value) {
      case r'authenticated':
        return AuthStateType.authenticated;
      case r'expired':
        return AuthStateType.expired;
      case r'signedOut':
        return AuthStateType.signedOut;
      case r'fail':
        return AuthStateType.fail;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AuthStateType self) {
    switch (self) {
      case AuthStateType.authenticated:
        return r'authenticated';
      case AuthStateType.expired:
        return r'expired';
      case AuthStateType.signedOut:
        return r'signedOut';
      case AuthStateType.fail:
        return r'fail';
    }
  }
}

extension AuthStateTypeMapperExtension on AuthStateType {
  String toValue() {
    AuthStateTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AuthStateType>(this) as String;
  }
}

