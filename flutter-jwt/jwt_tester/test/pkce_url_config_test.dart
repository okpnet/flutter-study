import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart'
    hide ByteData;
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:jwt_tester/pms_services/providers/pkce_url_config.dart';

void main() async {
  final certByts = await rootBundle.load('ca/fullchain.pem'); //アセットから
  final conf = PkceUrlConfig(
    baseUrl: baseUrl,
    tokenPath: tokenPath,
    redirectPath: redirectPath,
    apiPath: apiPath,
    certData: certByts,
  );
}
