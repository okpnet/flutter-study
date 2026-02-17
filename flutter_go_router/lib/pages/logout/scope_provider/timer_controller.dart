import 'dart:async';

class TimerController {
  Timer? _timer;
  final int tick;

  TimerController({required this.tick});

  void periodicStart(void Function(Timer) call) {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: tick), (t) => call(t));
  }

  void timer(void Function() call) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: tick), call);
  }

  void dispose() {
    _timer?.cancel();
  }
}
