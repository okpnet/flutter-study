import 'package:flutter_win_webview/auths/models/auth_token_mixin.dart';

const String AUTH_MODEL_KEY = "authstate";

class AuthStateModel with AuthTokenMixin {
  final String? code;
  final String? accessToken;

  AuthStateModel({this.code, this.accessToken});

  Map<String, dynamic> toJson() {
    return {"accessToken": accessToken, "code": code};
  }

  factory AuthStateModel.fromJson(Map<String, dynamic> json) {
    return AuthStateModel(accessToken: json['accessToken'], code: json['code']);
  }
}
