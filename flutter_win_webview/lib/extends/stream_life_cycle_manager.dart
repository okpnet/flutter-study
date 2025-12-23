import 'dart:async';

class StrreamLifeCycleManager {
  final Map<String, StreamSubscription> _subscriptions = {};
  //final List<StreamSubscription> _subscriptions = [];

  String add({String? key, StreamSubscription? subscription}) {
    if(key == null && subscription == null) {
      throw ArgumentError('Either key or subscription must be provided');
    }
    if(key == null) {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      _subscriptions[id] = subscription!;
      return id;
    }
    if(_subscriptions.containsKey(key))_subscriptions[key]?.cancel();
    _subscriptions[key] = subscription!;
    return key;
  }

  void dispose() {
    for (final sub in _subscriptions.values) {
      sub.cancel();
    }
    _subscriptions.clear();
  }

}