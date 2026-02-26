import 'dart:convert';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_win_webview_go_router/services/providers/auth/auth_model/authentication_model.dart';

part 'auth_state_kyclaok_model.mapper.dart';

@MappableClass()
class AuthStateKyclaokModel extends AuthenticationModel
    with AuthStateKyclaokModelMappable {
  final String? tokenId;
  final String? refreshToken;

  AuthStateKyclaokModel({
    required super.accessToken,
    required this.refreshToken,
    required this.tokenId,
    required super.code,
  });

  factory AuthStateKyclaokModel.fromResponse(String code, String body) {
    final map = json.decode(body) as Map<String, dynamic>;
    return AuthStateKyclaokModel(
      accessToken: map['access_token'] as String?,
      refreshToken: map['refresh_token'] as String?,
      tokenId: map['id_token'] as String?,
      code: code,
    );
  }
}
