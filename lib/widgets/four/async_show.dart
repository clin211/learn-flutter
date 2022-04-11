import 'package:flutter/material.dart';

class AsyncShow extends StatefulWidget {
  AsyncShow({Key? key}) : super(key: key);

  @override
  State<AsyncShow> createState() => _AsyncShowState();
}

class _AsyncShowState extends State<AsyncShow> {
  // 延迟3s返回一段字符串
  Future<String> loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    return "3s later return data";
  }

  // 返回一个异常
  Future<String> loadError() async {
    await Future.delayed(const Duration(seconds: 3));
    throw "3s later return error";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('3s later return data'),
          subtitle: FutureBuilder(
            future: loadData(), // 异步任务
            builder: ((context, snapshot) {
              // 判断 Future 是否完成
              if (snapshot.connectionState == ConnectionState.done) {
                return Text('${snapshot.data}');
              } else {
                return Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  child: const CircularProgressIndicator.adaptive(),
                );
              }
            }),
          ),
        ),
        ListTile(
          title: const Text('异步任务'),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 10),
            child: FutureBuilder(
                future: loadData(), // 异步任务
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  // 检查ConnectionState是否为done 以此判断是否完成
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Text('data is loading');
                  }
                  // 判断是否有错误
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('${snapshot.data}');
                  }
                }),
          ),
        ),
        ListTile(
          title: const Text('初始化值'),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 10),
            child: FutureBuilder(
                future: loadError(), // 异步任务
                initialData: 'init data', // 初始化值
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  // 检查ConnectionState是否为done 以此判断是否完成
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Text('data is loading');
                  }
                  // 判断是否有错误
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Text('${snapshot.data}');
                  } else {
                    throw Exception('initialData为null，hasData为false');
                  }
                }),
          ),
        ),
      ],
    );
  }
}
