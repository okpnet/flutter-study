import 'dart:convert';
import 'package:flutter_win_webview/auths/models/auth_state_kyclaok_model.dart';
import 'package:flutter_win_webview/auths/models/auth_state_model.dart';
import 'package:jwt_decode/jwt_decode.dart';

mixin AuthTokenMixin {
  String? accessToken;

  ExpiredStateType get isAccessTokenExpired {
    return accessToken == null
        ? ExpiredStateType.signedOut
        : Jwt.isExpired(accessToken!)
        ? ExpiredStateType.disabled
        : ExpiredStateType.enabled;
  }
}

enum ExpiredStateType { enabled, disabled, signedOut }
