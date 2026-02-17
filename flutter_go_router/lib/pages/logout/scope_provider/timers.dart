import 'package:flutter_go_router/pages/logout/scope_provider/timer_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timers.g.dart';

@riverpod
TimerController customTimer(Ref ref, int tick) {
  final timer = TimerController(tick: tick);
  ref.onDispose(() {
    timer.dispose();
  });
  return timer;
}
