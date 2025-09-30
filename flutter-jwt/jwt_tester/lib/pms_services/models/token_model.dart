

class TokenModel {
  final String accessToken;
  final String? refreshToken;
  final String? tokenype;
  final String? sessionState;
  final String? idToken;
  final DateTime expiresAt;
  final Map<String,String>? claims;

  TokenModel({
    required this.accessToken,
    required this.expiresAt,
    this.refreshToken,
    this.idToken,
    this.sessionState,
    this.tokenype,
    this.claims
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}