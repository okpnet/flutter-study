import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'refresh_listenable.g.dart';

@Riverpod(keepAlive: true)
Raw<ValueNotifier<int>> refreshListenable(Ref ref) {
  final notifier = ValueNotifier<int>(0);
  void notify() {
    Future.microtask(() {
      notifier.value++;
    });
  }

  // 各状態が変わったときに value を更新して通知をトリガー
  // final maintenanceInfoSub =
  //     ref.listen(isMaintenanceModeProvider, (_, __) => notify());

  ref.onDispose(() {
    notifier.dispose();
  });

  notifier.addListener(() {
    ref.notifyListeners();
    log('⭐️⭐️⭐️ notifier value ${notifier.value} ⭐️⭐️⭐️');
  });
  return notifier;
}
