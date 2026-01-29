import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class KeycloakAccessModel {
  static const String ENDPOINT_AUTH = "auth";
  static const String ENDPOINT_TOKEN = "token";
  static const String ENDPOINT_LOGOUT = "logout";
  static const String CHARENGE_METHOD = 'S256';
  static const List<String> DEFAULT_SCOPES = ['openid', 'profile', 'email'];

  // Configuration
  final String keycloakUrl;
  final String realms;
  final String clientId;
  final String redirectUri;
  final String codeVerifier;
  final String codeChallenge;
  final List<String> scopes;

  KeycloakAccessModel._(
    this.codeVerifier,
    this.codeChallenge, {
    required this.keycloakUrl,
    required this.realms,
    required this.clientId,
    required this.redirectUri,
    this.scopes = DEFAULT_SCOPES,
  });

  Map<String, dynamic> createUrlParameter() {
    final result = {
      'response_type': 'code',
      'client_id': clientId,
      'redirect_uri': redirectUri.toString(),
      'scope': scopes.join(' '),
      'code_challenge': codeChallenge,
      'code_challenge_method': CHARENGE_METHOD,
    };
    return result;
  }

  // Authorization URL
  Uri get authorizationUrl {
    final uri = Uri.parse(
      '$keycloakUrl/realms/$realms/protocol/openid-connect/$ENDPOINT_AUTH',
    );
    final newUri = uri.replace(queryParameters: createUrlParameter());
    return newUri;
  }

  // Token URL
  Uri get tokenUrl {
    final uri = Uri.parse(
      '$keycloakUrl/realms/$realms/protocol/openid-connect/$ENDPOINT_TOKEN',
    );
    return uri;
  }

  // Logout URL
  Uri get logoutUrl {
    final uri = Uri.parse(
      '$keycloakUrl/realms/$realms/protocol/openid-connect/$ENDPOINT_LOGOUT',
    );
    return uri;
  }

  static KeycloakAccessModel generate({
    required String keycloakUrl,
    required String realms,
    required String clientId,
    required String redirectUri,
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
      keycloakUrl: keycloakUrl,
      realms: realms,
      clientId: clientId,
      redirectUri: redirectUri,
      scopes: scopes,
    );
  }
}
