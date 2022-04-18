import 'package:flutter/material.dart';

class ScrollControllerWidget extends StatefulWidget {
  const ScrollControllerWidget({Key? key}) : super(key: key);

  @override
  State<ScrollControllerWidget> createState() => _ScrollControllerWidgetState();
}

class _ScrollControllerWidgetState extends State<ScrollControllerWidget> {
  final ScrollController _controller = ScrollController(); // 1.初始化

  @override
  void dispose() {
    _controller.dispose(); // 2.销毁
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int position = 0;
    return ListTile(
      title: Wrap(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: ElevatedButton(
              child: const Text('渐进式滚动'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.only(
                    top: 2,
                    bottom: 2,
                    left: 6,
                    right: 6,
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16),
                ),
              ),
              onPressed: () {
                _controller.animateTo(
                  _controller.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: ElevatedButton(
              child: const Text('跳转式滚动'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.only(
                    top: 2,
                    bottom: 2,
                    left: 6,
                    right: 6,
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16),
                ),
              ),
              onPressed: () {
                print(
                    '_controller.position.maxScrollExtent is 👉 ${_controller.position.maxScrollExtent}');
                _controller.jumpTo(0);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            // width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: ElevatedButton(
              child: const Text('获取当前滚动位置'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.only(
                    top: 2,
                    bottom: 2,
                    left: 6,
                    right: 6,
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 16),
                ),
              ),
              onPressed: () => setState(() {
                print('_controller offset is 👉 ${_controller.offset.toInt()}');
                position = _controller.offset.toInt();
              }),
            ),
          ),
        ],
      ),
      subtitle: ListView.separated(
        itemCount: 30,
        controller: _controller,
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.deepOrange,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 44,
            alignment: Alignment.centerLeft,
            child: Text(
              '第${index + 1}个',
              style: const TextStyle(color: Colors.deepOrange),
            ),
          );
        },
      ),
    );
  }
}
