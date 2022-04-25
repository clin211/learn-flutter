import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

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
        title: Text(widget.title),
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chapter_one');
              },
              child: const Text('widgets'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/chapter_two'),
              child: const Text('text and image'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/chapter_three'),
              child: const Text('user input'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/chapter_four'),
              child: const Text('async'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/chapter_five'),
              child: const Text('list'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/tabs'),
              child: const Text('纵向联动'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/tabs'),
              child: const Text('滚动监控'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/chapter_six'),
              child: const Text('布局'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/chapter_seven'),
              child: const Text('过渡动画'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/chapter_eight'),
              child: const Text('交互'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/drag_demo'),
              child: const Text('gesture detector drag'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/chapter_nine'),
              child: const Text('alert dialog'),
            ),
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
