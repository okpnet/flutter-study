import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:openid_client/openid_client_io.dart';
import 'Result.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

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


Future<Result<Credential>> authenticateWithPKCE(Uri url,String? certPath) async{
  try{
    final contextResult=await createSecurityContext(certPath);
    if(contextResult.isError || !contextResult.hasValue){
      throw Exception('Failed to create SecurityContext: ${contextResult.error}');
    }
    final ioClient=IOClient(HttpClient(context: contextResult.value));
    final issuer = await Issuer.discover(url, httpClient: ioClient);
    final client=Client(issuer, 'qual-app');
    // create a function to open a browser with an url
    urlLauncher(String urls) async {
        final uri = Uri.parse(urls);
        print('Launching URL: $urls');
        if (!await launchUrl(Uri.parse(urls), mode: LaunchMode.externalApplication)) {
          throw 'Could not launch $urls';
        }
    }

    final verifier = generateCodeVerifier();
    final challenge = generateCodeChallenge(verifier);

    final authenticator=Authenticator(
      client, 
      scopes: ['openid','profile','email','offline_access'],
      redirectUri: Uri.parse('http://localhost:4000/callback'),
      port: 4000,
      urlLancher: urlLauncher,
      prompt: 'login',
      additionalParameters: {
        'code_challenge': challenge,
        'code_challenge_method': 'S256',
        },
    );
    final credential=await authenticator.authorize();
    await closeInAppWebView();
    return Result(value: credential);
  }catch(e){
    return Result<Credential>(error: Exception('Authentication failed: $e'));
  }
}

Future<http.Response> securePost(Uri url, {Map<String, String>? headers, Object? body,String? certPath}) async {
  //url=JWT_URL='https://qmspi.local:8443/realms/pms'
  final contextResult=await createSecurityContext(certPath);
  if(contextResult.isError || !contextResult.hasValue){
    throw Exception('Failed to create SecurityContext: ${contextResult.error}');
  }

  final auth=await authenticateWithPKCE(url,certPath);
  if(auth.isError || !auth.hasValue){
    throw Exception('Authentication failed: ${auth.error}');
  }
  final ioClient=IOClient(HttpClient(context: contextResult.value));
  final token=auth.value!.getTokenResponse().toString();
  final addHeaders={
    'Authorization': 'Bearer $token)',
    if (headers != null) ...headers,
  };
  return ioClient.post(url, headers: addHeaders, body: body);
}

Future<Result<SecurityContext>> createSecurityContext(String? certPath) async{
  try{
    if(certPath == null){
      throw ArgumentError('certPath must be provided');
    }
    final certByts=await rootBundle.load(certPath);//アセットから
    if(certByts.lengthInBytes==0){
      throw Exception('Failed to load certificate from $certPath');
    }

    final context=SecurityContext(withTrustedRoots: false);
    context.setTrustedCertificatesBytes(certByts.buffer.asUint8List());
    return Result(value: context);
  }catch(e){
    return Result<SecurityContext>(error: Exception('Failed to create SecurityContext: $e'));
  }
}