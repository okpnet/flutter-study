import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';
part 'exprid.dart';

//ログイン状態管理
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  AuthNotifier();

  @override
  FutureOr<ExpiredStateType> build() => ExpiredStateType.disabled;

  Future<void> changeState(ExpiredStateType expired) async {
    await Future.delayed(Duration(seconds: 6));
    state = AsyncData(expired);
  }
}
