import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_screen.g.dart';

@Riverpod(keepAlive: true)
class LoadingScreenState extends _$LoadingScreenState {
  LoadingScreenState();

  @override
  bool build() {
    return false;
  }

  void update(bool newValue) {
    state = newValue;
  }
}

extension LoadingScreenRef on WidgetRef {
  void showLoading() {
    read(loadingScreenStateProvider.notifier).update(true);
  }

  void hideLoading() {
    read(loadingScreenStateProvider.notifier).update(false);
  }
}
