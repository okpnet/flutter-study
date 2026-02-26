import 'package:flutter_win_webview_go_router/services/providers/auth/auth_model/authentication_model.dart';
import 'package:flutter_win_webview_go_router/services/storages/converter/storage_item_converter.dart';

class AuthenticationModelConverter
    implements StorageTypeConverter<AuthenticationModel> {
  @override
  AuthenticationModel convertFromString(String data) {
    return AuthenticationModelMapper.fromJson(data);
  }

  @override
  String convertToString(AuthenticationModel item) {
    return item.toJson();
  }
}
