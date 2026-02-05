import 'dart:developer';
import 'package:flutter_win_webview/auths/models/auth_models.dart';
import 'package:flutter_win_webview/providers/auth_providers/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_state.g.dart';

enum AppPage { boot, top, loggedOut, signInWebView }

/// ルーター状態を管理する StateNotifier
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
  // 追加するページ群
  final List<AppPage> pages;
  // 認証状態を取得する関数
  // nullの場合は認証状態を考慮しない
  final AuthState Function()? funcState;
  // 移動状態
  final PageState pageState;
  // コンストラクタ
  ExpiredRouteHandler._({
    required this.pages,
    required this.pageState,
    required this.funcState,
  });

  factory ExpiredRouteHandler.popCreate({
    required List<AppPage> pages,
    AuthState Function()? funcState,
  }) {
    return ExpiredRouteHandler._(
      pages: pages,
      pageState: PageState.pop,
      funcState: funcState,
    );
  }

  factory ExpiredRouteHandler.pushCreate({
    required List<AppPage> pages,
    AuthState Function()? funcState,
  }) {
    return ExpiredRouteHandler._(
      pages: pages,
      pageState: PageState.push,
      funcState: funcState,
    );
  }

  factory ExpiredRouteHandler.resetCreate({
    required List<AppPage> pages,
    AuthState Function()? funcState,
  }) {
    return ExpiredRouteHandler._(
      pages: pages,
      pageState: PageState.rest,
      funcState: funcState,
    );
  }

  // ハンドラ実行
  List<AppPage> handle(RouteState state) {
    final list = switch (pageState) {
      PageState.pop => _handlePop(),
      PageState.push => _handlePush(state),
      PageState.rest => _handleReset(),
    };
    return _handleAuthState(list);
  }

  //戻るハンドラ
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

  //進むハンドラ
  List<AppPage> _handlePush(RouteState state) {
    return [...state.stack, ...pages];
  }

  //ページ再設定ハンドラ
  List<AppPage> _handleReset() {
    log('ExpiredRouteHandler: rest, no changes to pages.');
    return pages;
  }

  //認証状態ハンドラ
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
