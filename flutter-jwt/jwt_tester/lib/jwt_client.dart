import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<http.Response> securePost(Uri url, {Map<String, String>? headers, Object? body,String? certPath}) async {
  if(certPath == null){
    throw ArgumentError('certPath must be provided');
  }
  final certByts=await rootBundle.load(certPath);//アセットから
  if(certByts.lengthInBytes==0){
    throw Exception('Failed to load certificate from $certPath');
  }
  final context=SecurityContext(withTrustedRoots: false);
  context.setTrustedCertificatesBytes(certByts.buffer.asUint8List());
  final ioClient=IOClient(HttpClient(context: context));
  return ioClient.post(url, headers: headers, body: body);
}