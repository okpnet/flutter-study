//文字列コンバーターの実装例
import 'dart:convert';

import 'package:flutter_win_webview/auths/models/auth_state_model.dart';
import 'package:flutter_win_webview/storeges/storage_item_converter.dart';

class AuthStateModelConverter implements StorageTypeConverter<AuthStateModel> {
  @override
  String convertToString(AuthStateModel item) {
    return jsonEncode(item.toJson());
  }

  @override
  AuthStateModel convertFromString(String data) {
    // Basic implementation; in real scenarios, more complex logic may be needed
    Map<String, dynamic> map = jsonDecode(data);
    final result = AuthStateModel.fromJson(map);
    return result;
  }
}
