import 'dart:math';

import 'package:flutter/material.dart';

class StreamWidget extends StatefulWidget {
  StreamWidget({Key? key}) : super(key: key);

  @override
  State<StreamWidget> createState() => _StreamWidgetState();
}

class _StreamWidgetState extends State<StreamWidget> {
  // 箭头函数
  Stream<int> counter() =>
      Stream.periodic(const Duration(seconds: 1), (i) => i);

  // 利用Random随机数生成器，时而抛出异常
  Stream<int> randomCounter() => Stream.periodic(Duration(seconds: 1), (count) {
        if (Random.secure().nextBool()) {
          throw 'error';
        }
        return count;
      });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('每秒加1的计数器数据流'),
          subtitle: StreamBuilder(
            stream: counter(), // stream
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('没有Stream');

                case ConnectionState.waiting:
                  return const Text('等待数据...');

                case ConnectionState.active:
                  if (snapshot.hasError) {
                    return Text('数据流活跃异常：${snapshot.error}');
                  }
                  return Text('数据流活跃：${snapshot.data}');

                case ConnectionState.done:
                  return Text('数据流结束：${snapshot.data}');
                default:
                  return const Text('ConnectionState状态未知');
              }
            },
          ),
        ),
        ListTile(
          title: const Text('利用Random随机数生成器，时而抛出异常'),
          subtitle: StreamBuilder(
            stream: randomCounter(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
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
            },
          ),
        ),
      ],
    );
  }
}
