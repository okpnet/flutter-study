import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/auth_model/auth_state_type.dart';
import 'package:jwt_decode/jwt_decode.dart';

part 'authentication_model.mapper.dart';

@MappableClass()
class AuthenticationModel with AuthenticationModelMappable {
  final String? code;
  final String? accessToken;

  AuthStateType get isAccessTokenExpired {
    return accessToken == null || accessToken!.isEmpty
        ? AuthStateType.signedOut
        : Jwt.isExpired(accessToken!)
        ? AuthStateType.expired
        : AuthStateType.authenticated;
  }

  AuthenticationModel({this.code, this.accessToken});
}
