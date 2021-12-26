import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:route/main.dart';
import 'package:route/routes/routes.dart';
import 'package:route/setup_get_it.dart';

class Home extends StatefulWidget {
  // const Home({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.login);
              },
              child: const Text('login', style: TextStyle(fontSize: 20)),
            ),
            TextButton(
              onPressed: () {
                // Navigator.of(context).pushNamed('/detail/22');
                // 编程式导航
                FluroRouter router = getIt<FluroRouter>();
                router.navigateTo(
                  context,
                  '/dateil',
                  routeSettings: RouteSettings(
                    arguments: TestParams(22, 'Forest'),
                  ),
                );
              },
              child: const Text('detail', style: TextStyle(fontSize: 20)),
            ),
            TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "This is Center Short Toast",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: const Text('toast'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
