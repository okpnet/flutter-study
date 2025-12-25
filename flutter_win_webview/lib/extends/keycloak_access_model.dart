
        'response_type': 'code',
        'client_id': clientId,
        'redirect_uri': redirectUri.toString(),
        'scope': scopes.join(' '),
        'state': _state!,
        'code_challenge': challenge,
        'code_challenge_method': 'S256',
class KeycloakAccessModel {
  const String _codeCharengeMethod = 'S256';
  final String authorizationEndpoint;
  final String tokenEndpoint;
  final String clientId;
  final Uri redirectUri;
  final String codeVerifier;
  final String codeChallenge;
  final List<String> scopes;

  KeycloakAccessModel({
    required this.authorizationEndpoint,
    required this.tokenEndpoint,
    required this.clientId,
    required this.redirectUri,
    required this.scopes,
  });
}