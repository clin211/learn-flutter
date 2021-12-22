import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/store/actions.dart';
import 'package:redux_example/store/state.dart';

import 'store/reducers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store(appStateReducer, initialState: AppState(0));
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade400,
        title: const Text(
          'redux and flutter_redux',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('计数器的值：'),
            StoreConnector<AppState, String>(
              builder: (context, countStr) => Text(
                countStr,
                style: const TextStyle(fontSize: 30),
              ),
              converter: (store) => store.state.count.toString(),
            )
          ],
        ),
      ),
      floatingActionButton:
          StoreConnector<AppState, Function(CountActions action)>(
        builder: (context, callback) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                callback(CountActions.increment);
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                callback(CountActions.decrement);
              },
            ),
          ],
        ),
        converter: (store) {
          return (action) => store.dispatch(action);
        },
      ),
    );
  }
}
