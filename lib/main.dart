import 'package:flutter/material.dart';
import 'package:learn_book/pages/chapter/five.dart';
import 'package:learn_book/pages/chapter/four.dart';
import 'package:learn_book/pages/chapter/seven.dart';
import 'package:learn_book/pages/chapter/six.dart';
import 'package:learn_book/pages/chapter/three.dart';
import 'package:learn_book/pages/chapter/two.dart';
import 'package:learn_book/pages/home.dart';
import 'package:learn_book/pages/chapter/one.dart';
import 'package:learn_book/pages/page_view_demo.dart';
import 'package:learn_book/pages/tabs.dart';
import 'package:learn_book/widgets/eight/demo.dart';
import 'package:learn_book/widgets/six/boundaries/two.dart';

import 'pages/chapter/eight.dart';
import 'pages/chapter/nine.dart';

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
        '/main': (context) => Main(),
        '/home': (context) => const Home(title: 'Learn Book'),
        '/chapter_one': (context) => const ChapterOne(),
        '/chapter_two': (context) => const ChapterTwo(),
        '/chapter_three': (context) => const ChapterThree(),
        '/chapter_four': (context) => const ChapterFour(),
        '/chapter_five': (context) => const ChapterFive(),
        '/chapter_six': (context) => ChapterSix(),
        'chapter_six/one': (context) => BoundariesTwo(),
        '/chapter_seven': (context) => ChapterSeven(),
        '/chapter_eight': (context) => ChapterEight(),
        '/chapter_nine': (context) => const ChapterNine(),
        '/tabs': (context) => Detail(),
        '/drag_demo': (context) => DragDemo()
      },
      home: const Home(title: 'Learn Book'),
    );
  }
}
