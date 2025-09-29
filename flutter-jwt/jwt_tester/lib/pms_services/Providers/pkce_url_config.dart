import 'dart:io';
import 'dart:typed_data';
import 'package:jwt_tester/pms_services/extends/convert_helper.dart';
import 'base_url_config.dart';

class PkceUrlConfig extends BaseUrlConfig {
  @override final String baseUrl;
  final String tokenPath;
  final String redirectPath;
  final String apiPath;
  @override final ByteData? certData;

  late final SecurityContext? _context;

  PkceUrlConfig({
    required this.baseUrl,
    required this.tokenPath,
    required this.redirectPath,
    required this.apiPath,
    this.certData,
  }) {
    if(certData == null || certData!.lengthInBytes > 0)return;
    final context = SecurityContext(withTrustedRoots: true);
    context.setTrustedCertificatesBytes(certData!.buffer.asUint8List());
    _context = context;
  }

  Uri get authUrl => Uri.parse(baseUrl);
  Uri get tokenUrl => getUri(tokenPath);
  Uri get redirectUrl => Uri.parse(redirectPath);
  @override Uri get apiUrl => Uri.parse(apiPath);
  @override SecurityContext? get securityContext => _context;

  @override
  Map<String, dynamic> toMap()=> {
      'baseUrl': baseUrl,
      'tokenPath': tokenPath,
      'redirectPath': redirectPath,
      'apiPath': apiPath,
      'certData': ConvertHelper.base64FromByteData(certData),
    };

  static PkceUrlConfig fromMap(Map<String, dynamic> map) =>PkceUrlConfig(
      baseUrl: map['baseUrl'] as String,
      tokenPath: map['tokenPath'] as String,
      redirectPath: map['redirectPath'] as String,
      apiPath: map['apiPath'] as String,
      certData: ConvertHelper.convertByteData(map['certData']),
    );
}