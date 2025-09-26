class PkceConfig {
  final String clientId;
  final String challengeMethod; // e.g. "S256"
  final List<String> scopes;

  const PkceConfig({
    required this.clientId,
    this.challengeMethod = 'S256',
    this.scopes = const ['openid', 'profile', 'email', 'offline_access'],
  });

  Map<String, String> get additionalParameters => {
    'code_challenge_method': challengeMethod,
  };
}