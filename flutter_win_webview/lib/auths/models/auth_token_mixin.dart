import 'package:flutter_win_webview/auths/models/auth_models.dart';
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
