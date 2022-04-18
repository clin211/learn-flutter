import 'package:flutter/material.dart';

import 'chapter/three.dart';
import 'chapter/two.dart';

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  PageController _controller = PageController();
  List pages = [
    {
      'color': Colors.red,
      'title': ' JavaScript',
      'content': 'JavaScript是一种类型安全的脚本语言，是一种动态类型、弱类型的语言。'
    },
    {
      'color': Colors.blue,
      'title': ' Dart',
      'content': 'Dart是一种类型安全的静态类型语言，是一种强类型的语言。',
    },
    {
      'color': Colors.blue,
      'title': ' Flutter',
      'content': 'Flutter是一个轻量级的Android原生UI框架，它可以在iOS和Android上运行。',
    },
    {
      'color': Colors.orange,
      'title': ' React',
      'content': 'React是一个用于构建用户界面的JavaScript库。',
    },
    {
      'color': Colors.green,
      'title': ' Vue',
      'content': '渐进式JavaScript 框架一款用于构建 Web 界面，易学易用，性能出色且功能丰富的框架。',
    },
    {
      'color': Colors.deepPurple.shade600,
      'title': 'Go',
      'content': 'Go语言是一门面向对象编程语言，它的设计思想是面向对象编程，并且它的语法和语义与C语言类似。',
    }
  ];

// 自定义Json数据
  List listData = [
    {
      "title": "模拟Json数据1",
      "author": "Dart",
      "imageUrl":
          "http://sucai.suoluomei.cn/sucai_zs/images/20200226173153-2.jpg",
    },
    {
      "title": "模拟Json数据2",
      "author": "Dart",
      "imageUrl":
          "http://sucai.suoluomei.cn/sucai_zs/images/20200226173153-2.jpg",
    },
    {
      "title": "模拟Json数据3",
      "author": "Dart",
      "imageUrl":
          "http://sucai.suoluomei.cn/sucai_zs/images/20200226173153-2.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            onTap: (value) {
              print('value is 👉 $value');
              _controller.animateTo(value.toDouble(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut);
            },
            tabs: pages.map((e) => Tab(text: e['title'])).toList(),
          ),
        ),
        body: PageView(
          // scrollDirection: Axis.vertical, // 垂直
          scrollDirection: Axis.horizontal, // 水平
          pageSnapping: false, // 是否自动滑动到终点
          controller: _controller,
          children: pages
              .map(
                (item) => Scaffold(
                  appBar: AppBar(
                    title: Text(
                      item['title'],
                      style: const TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  body: Column(
                    children: listData.map(
                      (value) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 8,
                                bottom: 8,
                              ),
                              child: Text(
                                item['content'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Image.network(value["imageUrl"]),
                              title: Text(value["title"]),
                              subtitle: Text(value["author"]),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
