import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/providers/auth_providers/auth_state.dart';
import 'package:flutter_win_webview/providers/inialize.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_state.g.dart';

enum AppPage { boot, top, loggedOut, signInWebView }

@Riverpod(keepAlive: true)
class RouteState extends _$RouteState {
  final List<AppPage> stack = [AppPage.boot];

  RouteState();

  @override
  RouteState build() {
    // ここで初期状態を返す（非同期なら Future<String> にする）
    final isInit = ref.watch(initializeProvider(DEFAULT_PORT)).isLoading;
    log('RouteState build: isInit=$isInit');

    // // ★ここに listen を置く（1回だけ登録される）
    // ref.listen(authStateProvider, (prev, next) {
    //   log(
    //     'RouteState listen: auth changed ${prev?.expiredEvent} -> ${next.expiredEvent}',
    //   );
    //   // 認証状態が変わったときだけ stack を更新
    //   final newStack = _creteNewStack(next, state.stack);
    //   state = state.clone()
    //     ..stack
    //     ..stack.clear()
    //     ..stack.addAll(newStack);
    // });

    return this;
  }

  RouteState clone() {
    final cloned = RouteState();
    cloned.stack.addAll(stack);
    return cloned;
  }

  factory RouteState.addCrate(List<AppPage> pages) {
    final state = RouteState();
    state.stack.addAll(pages);
    return state;
  }

  factory RouteState.crate(List<AppPage> pages) {
    final state = RouteState();
    state.stack
      ..clear()
      ..addAll(pages);
    return state;
  }

  void update(RouteState newState) {
    final isInit = ref.watch(initializeProvider(DEFAULT_PORT)).isLoading;
    if (!isInit) {
      log('RouteState update: isInit=$isInit, newState=${newState.stack}');
    }
    final auth = ref.watch(authStateProvider);
    final newList = _creteNewStack(auth, newState.stack);
    log('RouteState update: newList=$newList');
    state = newState.clone()
      ..stack.clear()
      ..stack.addAll(newList);
  }

  List<AppPage> _creteNewStack(AuthState auth, List<AppPage> pages) {
    final result = switch (auth.expiredEvent.value) {
      ExpiredStateType.enabled =>
        pages.last == AppPage.signInWebView
            ? pages.sublist(0, pages.length - 1)
            : pages,
      _ =>
        pages.last == AppPage.signInWebView
            ? pages
            : [...pages, AppPage.signInWebView],
    };

    return result.isNotEmpty ? result : [AppPage.signInWebView];
  }
}
