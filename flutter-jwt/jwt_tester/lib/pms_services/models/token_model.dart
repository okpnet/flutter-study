

class TokenModel {
  final String accessToken;
  final String? refreshToken;
  final DateTime expiresAt;

  TokenModel({
    required this.accessToken,
    this.refreshToken,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}