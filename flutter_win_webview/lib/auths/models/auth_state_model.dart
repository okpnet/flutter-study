import 'package:flutter_win_webview/auths/models/auth_token_mixin.dart';

const String AUTH_MODEL_KEY = "authstate";

class AuthStateModel with AuthTokenMixin {
  final String? code;
  AuthStateModel({this.code, String? token}) {
    accessToken = token;
  }

  Map<String, dynamic> toJson() {
    return {"accessToken": accessToken, "code": code};
  }

  factory AuthStateModel.fromJson(Map<String, dynamic> json) {
    return AuthStateModel(token: json['accessToken'], code: json['code']);
  }
}
