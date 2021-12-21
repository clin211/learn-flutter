import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions { increment, decrement }

// 传递进来一个state + action  返回去一个新的state
int countReducer(int state, action) {
  if (action == Actions.increment) {
    return state + 1;
  }
  if (action == Actions.decrement) {
    return state - 1;
  }
  return state;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store(countReducer, initialState: 0);
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
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
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('计数器的值：'),
            StoreConnector<int, String>(
              builder: (context, countStr) => Text(
                countStr,
                style: const TextStyle(fontSize: 30),
              ),
              converter: (store) => store.state.toString(),
            )
          ],
        ),
      ),
      floatingActionButton: StoreConnector<int, Function>(
        builder: (context, callback) => FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            callback();
          },
        ),
        converter: (store) {
          return () => store.dispatch(Actions.increment);
        },
      ),
    );
  }
}
