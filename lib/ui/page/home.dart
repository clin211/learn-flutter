import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadTextContent();
  }

  String textContent = ''; // 一言的内容
  String from = ''; // 来源

  void loadTextContent() async {
    var url = Uri.parse('https://v1.hitokoto.cn?c=i');
    var response = await http.post(url);
    Map<String, dynamic> respData = json.decode(response.body);
    setState(() {
      textContent = respData['hitokoto'];
      from = respData['from_who'];
    });
    print(textContent);
    print(from);
  }

  Widget imageWidget() {
    return const CircleAvatar(
      backgroundColor: Colors.white70,
      foregroundImage: NetworkImage(
          'https://img.xjh.me/random_img.php?type=bg&ctype=nature&return=302'),
      radius: 90,
    );
  }

  Widget textWidget() {
    return Text(
      textContent + from,
      style: const TextStyle(color: Colors.black, fontSize: 12.0),
    );
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
