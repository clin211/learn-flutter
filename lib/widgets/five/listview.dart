import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  ListViewWidget({Key? key}) : super(key: key);

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemExtent: 80,
      itemBuilder: (BuildContext context, int index) {
        return Counter(index);
      },
    );
  }
}

class Counter extends StatefulWidget {
  final int index;
  const Counter(this.index);

  @override
  _CounterState createState() => _CounterState();
}

// 1. with AutomaticKeepAliveClientMixin 添加融合类
class _CounterState extends State<Counter> with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  // 3.声明需要保存的状态
  @override
  bool get wantKeepAlive => _counter != 0; // 仅需状态不为0时才保存

  @override
  Widget build(BuildContext context) {
    super.build(context); // 2.调用父级的方法
    return ElevatedButton(
      child: Text('第${widget.index + 1}个计数器： $_counter'),
      onPressed: () => setState(() => _counter++),
    );
  }
}
