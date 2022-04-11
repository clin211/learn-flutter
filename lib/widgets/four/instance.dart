import 'dart:async';

import 'package:flutter/material.dart';

class InstanceWidget extends StatefulWidget {
  const InstanceWidget({Key? key}) : super(key: key);

  @override
  State<InstanceWidget> createState() => _InstanceWidgetState();
}

class _InstanceWidgetState extends State<InstanceWidget> {
  // 定义一种类型int的Stream
  final _controller = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () => _controller.add(1),
                child: const Text('Emit one'),
              ),
              ElevatedButton(
                onPressed: () => _controller.add(2),
                child: const Text('Emit two'),
              ),
              ElevatedButton(
                onPressed: () => _controller.add(3),
                child: const Text('Emit three'),
              ),
              ElevatedButton(
                onPressed: () => _controller.add(4),
                child: const Text('Emit four'),
              ),
              ElevatedButton(
                onPressed: () => _controller.addError('oops'),
                child: const Text('Emit Error'),
              ),
              ElevatedButton(
                onPressed: () => _controller.close(),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
        StreamBuilder(
          // 监听需要传入的Stream
          stream: _controller.stream
              .map((event) => "获取数据: $event") // 将int转换成String
              .distinct(), // 去重
          initialData: 'initial data',
          builder: (context, snapshot) {
            print('正在重新绘制 StreamBuilder组件......');
            if (snapshot.connectionState == ConnectionState.done) {
              return const Text('数据流已关闭');
            }
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            if (snapshot.hasData) return Text('${snapshot.data}');
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
