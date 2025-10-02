// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jwt_tester/pms_services/configs/pms_config.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();//サービスバインディングの初期化

  test('URL launch test', () async {
    final certByts = await rootBundle.load('ca/fullchain.pem'); //アセットから

    final conf = PkceUrlConfig(
      baseUrl: 'https://okp-04.local:8443/realms/pms',
      redirectPath: 'http://localhost:4000/callback',
      apiPath: '/protocol/openid-connect/',
      pkceConfig: PkceConfig(clientId: 'app'),
      certData: certByts,
    );
    final json = jsonEncode(conf.toMap());
    print(json);
  });
}
