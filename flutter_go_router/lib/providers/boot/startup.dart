import 'package:flutter_go_router/providers/auth/auth_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'startup.g.dart';

@Riverpod(keepAlive: true)
Future<void> startup(Ref ref) async {
  //ここでサービスの初期化する
  ref.read(authProvider);

  await Future.delayed(Duration(seconds: 7));
}
