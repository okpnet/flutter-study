
class UrlConfig {
  // 認可サーバーのベースURL
  final String baseUrl;// 'https://example.com/realms/pms';
  // トークン取得パス
  final String tokenPath ;// '/protocol/openid-connect/token';
  // リダイレクト先（PKCE用）
  final String redirectPath ;// 'http://localhost:4000/callback';
  // APIパス
  final String apiPath ;// 'https://api.example.com/graphql';

  // 認証用（認可コード取得）
  Uri get authUrl => Uri.parse(baseUrl);
  //  トークン取得用
  Uri get tokenUrl => Uri.parse('$baseUrl$tokenPath');
  // リダイレクト用
  Uri get redirectUrl => Uri.parse(redirectPath);
  // API用
  Uri get apiUrl => Uri.parse(apiPath);

  UrlConfig({this.baseUrl="", this.tokenPath="", this.apiPath="", this.redirectPath=""});

  factory UrlConfig.fromMap(Map<String, dynamic> map) {
    return UrlConfig(
      baseUrl: map['baseUrl'] ?? '',
      tokenPath: map['tokenPath'] ?? '',
      apiPath: map['apiPath'] ?? '',
      redirectPath: map['redirectPath'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'baseUrl': baseUrl,
      'tokenPath': tokenPath,
      'apiPath': apiPath,
      'redirectPath': redirectPath,
    };
  }
}