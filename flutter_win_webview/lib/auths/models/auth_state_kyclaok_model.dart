import 'dart:convert';

import 'package:flutter_win_webview/auths/models/auth_state_model.dart';
import 'package:flutter_win_webview/auths/models/auth_token_mixin.dart';

class AuthStateKyclaokModel extends AuthStateModel with AuthTokenMixin {
  final String? tokenId;
  final String? refreshToken;

  AuthStateKyclaokModel({
    required super.token,
    required this.refreshToken,
    required this.tokenId,
    required super.code,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      "accessToken": accessToken,
      "refreshToken": refreshToken,
      "tokenId": tokenId,
      "code": code,
    };
  }

  factory AuthStateKyclaokModel.fromJson(Map<String, dynamic> json) {
    return AuthStateKyclaokModel(
      token: json['accessToken'],
      refreshToken: json['refreshToken'],
      tokenId: json['tokenId'],
      code: json['code'],
    );
  }

  factory AuthStateKyclaokModel.fromResponse(String code, String body) {
    final map = json.decode(body) as Map<String, dynamic>;
    return AuthStateKyclaokModel(
      token: map['access_token'] as String?,
      refreshToken: map['refresh_token'] as String?,
      tokenId: map['id_token'] as String?,
      code: code,
    );
  }
}
