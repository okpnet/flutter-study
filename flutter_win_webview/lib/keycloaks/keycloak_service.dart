import 'dart:convert';
import 'dart:io';
import 'dart:math';

import '../models/pms_model.dart';

class KeycloakService {
  // Keycloak service implementation
  // final String baseUrl;
  // final String realm;
  // final String clientId;
  // final Uri redirectUri;

  // PKCEModel _pkceModel = PKCEModel.generate();

  // String? _state;

  // Uri buildAuthorizeUrl({
  //   List<String> scopes = const ['openid', 'profile', 'email'],
  // }) {
  //   _state = _randomState();

  //   return Uri.parse(
  //     '$baseUrl/realms/$realm/protocol/openid-connect/auth',
  //   ).replace(
  //     queryParameters: {
  //       'response_type': 'code',
  //       'client_id': clientId,
  //       'redirect_uri': redirectUri.toString(),
  //       'scope': scopes.join(' '),
  //       'state': _state,
  //       'code_challenge': _pkceModel.challenge,
  //       'code_challenge_method': 'S256',
  //     },
  //   );
  // }

  // Future<Map<String, dynamic>> exchangeCodeForTokens(String code) {
  //   final tokenUrl = Uri.parse(
  //     '$baseUrl/realms/$realm/protocol/openid-connect/token',
  //   );
  //   final body = {
  //     'grant_type': 'authorization_code',
  //     'client_id': clientId,
  //     'code': code,
  //     'redirect_uri': redirectUri.toString(),
  //     'code_verifier': _pkceModel.verifier,
  //   };

  //   final res = await http.post(
  //     tokenUrl,
  //     headers: {
  //       HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  //     },
  //     body: body,
  //   );
  //   if (res.statusCode != 200) throw Exception('Token exchange failed');
  //   return jsonDecode(res.body);
  // }

  // String _randomState() => base64UrlEncode(
  //   List<int>.generate(16, (_) => Random.secure().nextInt(256)),
  // );
}
