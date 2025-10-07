import 'dart:async';

class StrreamLifeCycleManager {
  final Map<String, StreamSubscription> _subscriptions = {};
  final List<StreamSubscription> _subscriptions = [];

  String add({String? key, StreamSubscription subscription}) {
    if()
    _subscriptions[key]?.cancel();
    _subscriptions[key] = subscription;
  }
  void add(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  void dispose() {
    for (final sub in _subscriptions) {
      sub.cancel();
    }
    _subscriptions.clear();
  }

}