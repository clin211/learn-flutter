import 'package:flutter/material.dart';

class DragWidget extends StatefulWidget {
  DragWidget({Key? key}) : super(key: key);

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  var list = ['在汗水中奋斗之后终将绽放', '梦想如同花朵一样', '努力的前往也永远不曾改变方向'];

  final shades = [700, 200, 300, 500, 600, 800, 900];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.all(16),
      child: ReorderableListView(
        header: Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 20,
          ),
          child: const Text(
            '长按拖动排序:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        onReorder: (int old, int now) {
          print('用户把位于: $old的元素移到$now的位置');
          if (now > old) now--;
          setState(() {
            final shade = shades.removeAt(old);
            shades.insert(now, shade);
          });
        },
        // children: <Widget>[
        // for (var i = 0; i < list.length; i++)
        //   Container(
        //     padding: const EdgeInsets.only(left: 10, right: 10),
        //     height: 44,
        //     key: ValueKey(i),
        //     child: Text(list[i]),
        //   ),
        // ],
        children: shades
            .map(
              (shade) => Container(
                height: 56,
                key: ValueKey(shade),
                padding: const EdgeInsets.only(left: 10, right: 10),
                color: Colors.purple[shade],
              ),
            )
            .toList(),
      ),
    );
  }
}
