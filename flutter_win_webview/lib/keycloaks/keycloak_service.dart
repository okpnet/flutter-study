class KeycloakService {
  // Keycloak service implementation
  final String baseUrl;
  final String realm;
  final String clientId;
  final Uri redirectUri;

  String? _codeVerifier;
  String? _state;

  Uri buildAuthorizeUrl({
    List<String> scopes = const ['openid', 'profile', 'email'],
  }) {
    _codeVerifier = generateCodeVerifier();
    final challenge = codeChallengeS256(_codeVerifier!);
    _state = _randomState();

    return Uri.parse(
      '$baseUrl/realms/$realm/protocol/openid-connect/auth',
    ).replace(
      queryParameters: {
        'response_type': 'code',
        'client_id': clientId,
        'redirect_uri': redirectUri.toString(),
        'scope': scopes.join(' '),
        'state': _state!,
        'code_challenge': challenge,
        'code_challenge_method': 'S256',
      },
    );
  }

  Future<Map<String, dynamic>> exchangeCodeForTokens(String code) async {
    final tokenUrl = Uri.parse(
      '$baseUrl/realms/$realm/protocol/openid-connect/token',
    );
    final body = {
      'grant_type': 'authorization_code',
      'client_id': clientId,
      'code': code,
      'redirect_uri': redirectUri.toString(),
      'code_verifier': _codeVerifier!,
    };

    final res = await http.post(
      tokenUrl,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: body,
    );
    if (res.statusCode != 200) throw Exception('Token exchange failed');
    return jsonDecode(res.body);
  }

  String _randomState() => base64UrlEncode(
    List<int>.generate(16, (_) => Random.secure().nextInt(256)),
  );
}
