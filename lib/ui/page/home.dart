import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget imageWidget() {
    return const CircleAvatar(
      backgroundColor: Colors.white70,
      foregroundImage: NetworkImage(
          'https://img.xjh.me/random_img.php?type=bg&ctype=nature&return=302'),
      radius: 90,
    );
  }

  Widget textWidget() {
    return const Text('text example');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[imageWidget(), textWidget()],
        ),
      ),
    );
  }
}
