
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class UrlConfig {
  // 認可サーバーのベースURL
  final String baseUrl;// 'https://example.com/realms/pms';
  // トークン取得パス
  final String tokenPath ;// '/protocol/openid-connect/token';
  // リダイレクト先（PKCE用）
  final String redirectPath ;// 'http://localhost:4000/callback';
  // APIパス
  final String apiPath ;// 'https://api.example.com/graphql';

  late final ByteData? certData;
  // 認証用（認可コード取得）
  Uri get authUrl => Uri.parse(baseUrl);
  //  トークン取得用
  Uri get tokenUrl => Uri.parse('$baseUrl$tokenPath');
  // リダイレクト用
  Uri get redirectUrl => Uri.parse(redirectPath);
  // API用
  Uri get apiUrl => Uri.parse(apiPath);

  SecurityContext? securityContext;

  UrlConfig({this.baseUrl="", this.tokenPath="", this.apiPath="", this.redirectPath="",ByteData ? certData}) {
    if (certData != null && certData.lengthInBytes > 0) {
      this.certData = certData;
      final context = SecurityContext(withTrustedRoots: true);
      context.setTrustedCertificatesBytes(certData.buffer.asUint8List());
    }
  }

  factory UrlConfig.fromMap(Map<String, dynamic> map) {
    return UrlConfig(
      baseUrl: map['baseUrl'] ?? '',
      tokenPath: map['tokenPath'] ?? '',
      apiPath: map['apiPath'] ?? '',
      redirectPath: map['redirectPath'] ?? '',
      certData: map['certData'] ? ByteData.sublistView(base64Decode(map['certData'])) : null,
    );
  }

  Map<String, dynamic> toMap() {
    var list=certData?.buffer.asInt8List();
    return {
      'baseUrl': baseUrl,
      'tokenPath': tokenPath,
      'apiPath': apiPath,
      'redirectPath': redirectPath,
      'certData': list !=null ? base64Encode(list) : null,
    };
  }
}