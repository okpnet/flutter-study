import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:jwt_decode/jwt_decode.dart';

const String AUTH_MODEL_KEY = "authstate";

class AuthStateModel implements IAuthTokenExpored {
  final String? code;
  final String? accessToken;

  @override
  ExpiredStateType get isAccessTokenExpired {
    return accessToken == null || accessToken!.isEmpty
        ? ExpiredStateType.signedOut
        : Jwt.isExpired(accessToken!)
        ? ExpiredStateType.disabled
        : ExpiredStateType.enabled;
  }

  AuthStateModel({this.code, this.accessToken});

  Map<String, dynamic> toJson() {
    return {"accessToken": accessToken, "code": code};
  }

  factory AuthStateModel.fromJson(Map<String, dynamic> json) {
    return AuthStateModel(accessToken: json['accessToken'], code: json['code']);
  }
}
