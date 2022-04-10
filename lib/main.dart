import 'package:flutter/material.dart';
import 'package:learn_book/pages/chapter/three.dart';
import 'package:learn_book/pages/chapter/two.dart';
import 'package:learn_book/pages/home.dart';
import 'package:learn_book/pages/chapter/one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // 去掉右上角debug标记
      routes: {
        '/home': (context) => const Home(title: 'Learn Book'),
        '/chapter_one': (context) => const ChapterOne(),
        '/chapter_two': (context) => const ChapterTwo(),
        '/chapter_three': (context) => const ChapterThree(),
      },
      home: const Home(title: 'Learn Book'),
    );
  }
}
