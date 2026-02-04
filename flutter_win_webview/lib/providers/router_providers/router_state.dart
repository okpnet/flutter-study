import 'dart:developer';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/providers/auth_providers/auth_state.dart';
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
  void update(ExpiredRouteHandler handler) {
    // final isInit = ref.watch(initializeProvider(DEFAULT_PORT)).isLoading;
    final newPages = handler.handle(this);
    state = RouteState.crate(newPages);
  }
}

enum PageState { pop, push, rest }

/// ---- 付帯クラス ----
class ExpiredRouteHandler {
  ExpiredRouteHandler({required this.pages, this.funcState});

  final List<AppPage> pages;
  final AuthState Function()? funcState;

  PageState _pageState = PageState.rest;

  void reset() => _pageState = PageState.rest;
  void pop() => _pageState = PageState.pop;
  void push() => _pageState = PageState.push;

  List<AppPage> handle(RouteState state) {
    final list = switch (_pageState) {
      PageState.pop => _handlePop(),
      PageState.push => _handlePush(state),
      PageState.rest => _handleRest(),
    };
    return _handleAuthState(list);
  }

  List<AppPage> _handlePop() {
    if (pages.length > 1) {
      final newPages = [...pages]..removeLast();
      log('ExpiredRouteHandler: pop page, newPages=$newPages');
      return newPages;
    } else {
      log('ExpiredRouteHandler: cannot pop, only one page left.');
      return pages;
    }
  }

  List<AppPage> _handlePush(RouteState state) {
    return [...state.stack, ...pages];
  }

  List<AppPage> _handleRest() {
    log('ExpiredRouteHandler: rest, no changes to pages.');
    return pages;
  }

  List<AppPage> _handleAuthState(List<AppPage> list) {
    final authState = funcState?.call().expiredEvent.value;
    if (authState == null) {
      log('ExpiredRouteHandler: authState is null, returning pages as is.');
      return list;
    }
    return switch (authState) {
      ExpiredStateType.signedOut => [...list, AppPage.signInWebView],
      ExpiredStateType.disabled => [...list, AppPage.loggedOut],
      _ => list,
    };
  }
}
