import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/homes/home_router.dart';
import 'package:flutter_go_router/pages/login/login_router.dart';
import 'package:flutter_go_router/providers/auth/auth_notifier.dart';
import 'package:flutter_go_router/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state_routing.g.dart';

@Riverpod(keepAlive: true)
FutureOr<void> appStateRouting(Ref ref) async {
  //log('とおりみち=>${router.state.fullPath}');
  //ログイン状態に応じて切り替え
  ref.listen<AsyncValue<ExpiredStateType>>(authProvider, (prev, next) {
    log('ログイン変更イベント');
    final router = ref.read(routerProvider);
    // 1. 未ログイン → LoginRoute に push
    if (next.value != ExpiredStateType.enabled) {
      // すでに login にいる場合は push しない
      if (router.state.path != loginPath) {
        router.push(loginPath);
      }
    }

    // 2. ログイン成功 → pop
    if (prev?.value != ExpiredStateType.enabled &&
        next.value == ExpiredStateType.enabled) {
      if (router.canPop()) {
        router.pop();
      } else {
        log('強制 Home遷移');
        router.go(homeRouterPath);
      }
    }
  });
}
