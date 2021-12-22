import 'dart:developer';

import 'package:redux_example/store/state.dart';

import 'actions.dart';

// 传递进来一个state + action  返回去一个新的state
int countReducer(int state, action) {
  if (action == CountActions.increment) {
    return state + 1;
  }
  if (action == CountActions.decrement) {
    return state - 1;
  }
  return state;
}

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
    countReducer(state.count, action),
  );
}
