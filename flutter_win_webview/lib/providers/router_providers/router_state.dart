import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/providers/auth_providers/auth_state.dart';
import 'package:flutter_win_webview/providers/inialize.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_state.g.dart';

enum AppPage { boot, top, loggedOut, signInWebView }

@riverpod
class RouteState extends _$RouteState {
  final List<AppPage> stack = [AppPage.boot];

  RouteState();

  @override
  RouteState build() {
    // ここで初期状態を返す（非同期なら Future<String> にする）
    return this;
  }

  RouteState clone() {
    final cloned = RouteState();
    cloned.stack.addAll(stack);
    return cloned;
  }

  factory RouteState.crate(List<AppPage> pages) {
    final state = RouteState();
    state.stack.addAll(pages);
    return state;
  }

  void update(RouteState newState) {
    state = newState; // 内部では state にアクセス可能
  }
}
