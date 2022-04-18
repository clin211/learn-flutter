import 'package:flutter/material.dart';

class ListWheelScrollWidget extends StatefulWidget {
  ListWheelScrollWidget({Key? key}) : super(key: key);

  @override
  State<ListWheelScrollWidget> createState() => _ListWheelScrollWidgetState();
}

class _ListWheelScrollWidgetState extends State<ListWheelScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 40,
      offAxisFraction: -1.2, // 垂直方向的偏移量
      useMagnifier: true, // 放大镜
      // magnification: 1.5, // 放大倍数
      overAndUnderCenterOpacity: .5, // 中间透明度
      diameterRatio: .5,
      onSelectedItemChanged: (value) {
        print('value: $value');
      },
      children: [
        for (int i = 0; i < 30; i++)
          Container(
            height: 30,
            alignment: Alignment.center,
            color: Colors.grey,
            child: Text('4月${i + 1}日'),
          ),
      ],
    );
    // return ListView(
    //   children: [
    //     ListTile(
    //       title: const Text('常用属性'),
    //       subtitle: ,
    //     ),
    //     // ListTile(
    //     //   title: const Text('常用属性'),
    //     //   subtitle: ListWheelScrollView(
    //     //     itemExtent: 40,
    //     //     diameterRatio: 2.0,
    //     //     children: List.generate(
    //     //       30,
    //     //       (index) => Container(
    //     //         color: Colors.grey,
    //     //         alignment: Alignment.center,
    //     //         child: Text('$index'),
    //     //       ),
    //     //     ),
    //     //   ),
    //     // ),
    //   ],
    // );
  }
}
