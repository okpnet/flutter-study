import 'dart:developer';

import 'package:flutter_win_webview_go_router/services/options/defaultresult.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/auth_model/auth_state_type.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/auth_model/authentication_model.dart';
import 'package:flutter_win_webview_go_router/services/storages/rider_writer/istorage_reader_writer.dart';

/// 認証状態をストレージで管理するクラス
class KeycloakAuthStateHandler {
  final IStorageReaderWriter readerWriter;
  static const String AUTH_MODEL_KEY = "authstate";

  KeycloakAuthStateHandler({required this.readerWriter});

  /// ストレージから認証モデルを取得
  Future<AuthenticationModel?> getStoredAuthModel() async {
    final result = await readerWriter.read<AuthenticationModel>(AUTH_MODEL_KEY);
    return switch (result) {
      Success<AuthenticationModel>() => result.value,
      Failure<AuthenticationModel>() => null,
      Warning<AuthenticationModel>() => null,
    };
  }

  /// 認証モデルをストレージに保存
  Future<void> saveAuthModel(AuthenticationModel model) async {
    await readerWriter.write<AuthenticationModel>(AUTH_MODEL_KEY, model);
  }

  /// トークンが有効期限切れかどうかを確認
  bool isTokenExpired(AuthenticationModel model) {
    return model.isAccessTokenExpired == AuthStateType.authenticated;
  }

  /// ストレージから認証状態を削除
  Future<void> clearAuthState() async {
    await readerWriter.delete(AUTH_MODEL_KEY);
  }

  /// トークン更新が必要かどうかを確認
  Future<bool> shouldRefreshToken() async {
    final model = await getStoredAuthModel();
    if (model == null) return false;
    return isTokenExpired(model);
  }

  /// ログアウト前の認証状態チェック
  Future<bool> isAuthenticatedForLogout() async {
    final model = await getStoredAuthModel();
    if (model == null) return false;
    return isTokenExpired(model);
  }
}
