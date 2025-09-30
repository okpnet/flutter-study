import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

abstract class BaseUrlConfig{
  String get baseUrl;
  Uri get apiUrl;
  SecurityContext? get securityContext;

  ByteData? get certData;

  Uri getUri(String path) => Uri.parse('$baseUrl$path');
  /// シリアライズ用
  Map<String, dynamic> toMap(){
    final certList = certData?.buffer.asUint8List();
    return {
      'baseUrl': baseUrl,
      'certData': certList != null ? base64Encode(certList) : null,
    };
  }
}