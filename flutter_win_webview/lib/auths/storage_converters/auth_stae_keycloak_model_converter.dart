import 'dart:convert';

import 'package:flutter_win_webview/auths/models/auth_state_kyclaok_model.dart';
import 'package:flutter_win_webview/storeges/storage_item_converter.dart';

class AuthStaeKeycloakModelConverter
    implements StorageTypeConverter<AuthStateKyclaokModel> {
  @override
  String convertToString(AuthStateKyclaokModel item) {
    return jsonEncode(item.toJson());
  }

  @override
  AuthStateKyclaokModel convertFromString(String data) {
    // Basic implementation; in real scenarios, more complex logic may be needed
    Map<String, dynamic> map = jsonDecode(data);
    final result = AuthStateKyclaokModel.fromJson(map);
    return result;
  }
}
