// import 'package:flutter/cupertino.dart';
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  void handleOnPressed() {
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 50,
              bottom: 30,
            ),
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/avatar.jpg'),
                radius: 50,
              ),
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            padding:
                const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone, color: Colors.blue),
                    suffixIcon: Icon(Icons.close, color: Colors.grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                ),
                Stack(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.blue),
                        suffixIcon: Icon(Icons.close, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                      right: 50,
                      child: TextButton(
                        child: const Text('获取验证码'),
                        onPressed: handleOnPressed,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                        child: const Text('login'),
                        onPressed: () {
                          print('object');
                        }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
