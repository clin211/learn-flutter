import 'package:flutter/material.dart';

class UserController extends StatefulWidget {
  UserController({Key? key}) : super(key: key);

  @override
  State<UserController> createState() => _UserControllerState();
}

class _UserControllerState extends State<UserController> {
  // 初始化
  final TextEditingController _email =
      TextEditingController(text: 'init content');
  final TextEditingController _password = TextEditingController();

  // 释放资源
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: 12,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 44,
                child: TextField(
                  controller: _email,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.all(15),
                    labelText: 'Email',
                    hintText: 'Please input your email',
                    prefix: const SizedBox(
                        height: 30,
                        child: Icon(Icons.email_outlined, size: 24)),
                    suffix: IconButton(
                      icon: const Icon(Icons.clear, size: 24),
                      onPressed: () {
                        _email.clear();
                      },
                    ),
                    labelStyle: const TextStyle(fontSize: 14),
                    // 无聚焦时的边框
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),

                    // 聚焦时的边框
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 44,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'Please input your password',
                    prefix: const Icon(Icons.lock_clock_outlined),
                    suffix: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _email.clear();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: TextField(
                  controller: _password,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "请输入用户名",
                    // prefix: const Icon(Icons.person),
                    // 未获得焦点下划线设为灰色
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    //获得焦点下划线设为蓝色
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container()
      ],
    );
  }
}
