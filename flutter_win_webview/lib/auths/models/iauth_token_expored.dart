import 'package:flutter_win_webview/auths/models/auth_models.dart';

abstract interface class IAuthTokenExpored {
  ExpiredStateType get isAccessTokenExpired;
}
