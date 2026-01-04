import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class KeycloakAccessModel {
  static const String _codeCharengeMethod = 'S256';
  final String authorizationEndpoint;
  final String tokenEndpoint;
  final String clientId;
  final Uri redirectUri;
  final String codeVerifier;
  final String codeChallenge;
  final List<String> scopes;

  KeycloakAccessModel._(
    this.codeVerifier,
    this.codeChallenge, {
    required this.authorizationEndpoint,
    required this.tokenEndpoint,
    required this.clientId,
    required this.redirectUri,
    required this.scopes,
  });

  Map<String, dynamic> createUrlParameter() {
    final result = {
      'response_type': 'code',
      'client_id': clientId,
      'redirect_uri': redirectUri.toString(),
      'scope': scopes.join(' '),
      'code_challenge': codeChallenge,
      'code_challenge_method': _codeCharengeMethod,
    };
    return result;
  }

  Uri get authorizationUrl {
    final uri = Uri.parse(authorizationEndpoint);
    final newUri = uri.replace(queryParameters: createUrlParameter());
    return newUri;
  }

  static KeycloakAccessModel generate({
    required String authorizationEndpoint,
    required String tokenEndpoint,
    required String clientId,
    required Uri redirectUri,
    required List<String> scopes,
  }) {
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
    return KeycloakAccessModel._(
      v,
      c,
      authorizationEndpoint: authorizationEndpoint,
      tokenEndpoint: tokenEndpoint,
      clientId: clientId,
      redirectUri: redirectUri,
      scopes: scopes,
    );
  }
}
