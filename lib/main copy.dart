import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

// 应用入口
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(),
    //     body: Container(
    //       color: const Color.fromRGBO(255, 255, 255, 1.0),
    //       child: const Text(
    //         'Flutter 入门',
    //         textDirection: TextDirection.ltr,
    //       ),
    //     ),
    //   ),
    // );
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
        child: SafeArea(
          child: Container(
            // padding: const EdgeInsets.only(top: 110),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CupertinoTextField(
                  padding: EdgeInsets.all(10),
                  prefix: Icon(Icons.phone, color: Colors.red),
                  suffix: Icon(Icons.close, color: Colors.grey),
                ),
                const CupertinoTextField(
                  padding: EdgeInsets.all(10),
                  prefix: Icon(Icons.lock, color: Colors.red),
                  suffix: Icon(Icons.close, color: Colors.grey),
                ),
                CupertinoButton(
                    child: const Text('login'),
                    onPressed: () {
                      print('object');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
