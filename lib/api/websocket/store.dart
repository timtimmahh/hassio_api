/*
import 'dart:async';

import 'types.dart' show UnsubscribeFunc;

typedef Listener<State> = void Function(State state);
typedef Action<State> = FutureOr<State>? Function(
    State state, List<dynamic> args);
typedef BoundAction<State> = void Function(List<dynamic> args);

class Store<State> {
  State? state;
  BoundAction<State> Function(Action<State> action) action;
  void Function(State update, bool? overwrite) setState;
  UnsubscribeFunc Function(Listener<State> listener) subscribe;

  Store(
      {this.state,
      required this.action,
      required this.setState,
      required this.subscribe});
}

Store<State> createStore<State>(State? state) {
  List<Listener<State>> listeners = [];

  void unsubscribe(Listener<State>? listener) {
    var out = <Listener<State>>[];
    for (var i = 0; i < listeners.length; i++) {
      if (listeners[i] == listener) {
        listener = null;
      } else {
        out.add(listeners[i]);
      }
    }
    listeners = out;
  }
}*/
