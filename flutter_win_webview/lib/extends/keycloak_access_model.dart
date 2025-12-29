
        'response_type': 'code',
        'client_id': clientId,
        'redirect_uri': redirectUri.toString(),
        'scope': scopes.join(' '),
        'state': _state!,
        'code_challenge': challenge,
        'code_challenge_method': 'S256',
class KeycloakAccessModel {
  static const String _codeCharengeMethod = 'S256';
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
  }){

  }

  Map<String,dynamic> createUrlParameter(){
    final result={
      'response_type':'code',
      'client_id':clientId,
      'redirect_uri':redirectUri.toString(),
      'scope':scopes.join(' '),
      'code_challenge':codeChallenge,
      'code_challenge_method':_codeCharengeMethod,
    };
    return result;
  }

  Uri get authorizationUrl {
    final uri = Uri.parse(authorizationEndpoint);
    final newUri = uri.replace(queryParameters: createUrlParameter());
    return newUri;
  }

  
  KeycloakAccessModel._(this.codeVerifier, this.codeChallenge);

  static KeycloakAccessModel generate() {
    String generateCodeVerifier() {
      final random = Random.secure();
      final values = List<int>.generate(32, (i) => random.nextInt(256));
      return base64UrlEncode(values).replaceAll('=', '');
    }

    String generateCodeChallenge(String verifier) {
      final bytes = utf8.encode(verifier);
      final digest = sha256.convert(bytes);
      return base64UrlEncode(digest.bytes).replaceAll('=', '');
    }

    final v = generateCodeVerifier();
    final c = generateCodeChallenge(v);
    return PKCEModel._(v, c);
  }
}