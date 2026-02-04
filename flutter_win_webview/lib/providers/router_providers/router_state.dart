import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_state.g.dart';

enum AppPage { boot, top, loggedOut, signInWebView }

@riverpod
class RouteState extends _$RouteState {
  final List<AppPage> stack = [AppPage.boot];

  RouteState();

  @override
  RouteState build() {
    log('RouteState build');
    return this;
  }

  RouteState clone() {
    final cloned = RouteState();
    cloned.stack.addAll(stack);
    return cloned;
  }

  // factory RouteState.addCrate(List<AppPage> pages) {
  //   final state = RouteState();
  //   state.stack.addAll(pages);
  //   return state;
  // }

  factory RouteState.crate(List<AppPage> pages) {
    final state = RouteState();
    state.stack
      ..clear()
      ..addAll(pages.isEmpty ? [AppPage.top] : pages);
    return state;
  }

  void pop() {
    // スタックが1つ以上ある場合だけ pop 相当を行う
    if (state.stack.length > 1) {
      final newStack = [...stack]..removeLast();
      final newState = clone()
        ..stack.clear()
        ..stack.addAll(newStack);
      update(newState);
    } else {
      log('RouteState pop: stack has only one page, cannot pop.');
      final newState = clone()..stack.add(AppPage.top);
      update(newState);
    }
  }

  void update(RouteState newState) {
    // final isInit = ref.watch(initializeProvider(DEFAULT_PORT)).isLoading;
    state = newState.stack.isEmpty ? RouteState.crate([AppPage.top]) : newState;
  }
}
