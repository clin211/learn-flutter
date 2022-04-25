import 'package:flutter/material.dart';

class CompositedTransformFollowerWidget extends StatefulWidget {
  const CompositedTransformFollowerWidget({Key? key}) : super(key: key);

  @override
  State<CompositedTransformFollowerWidget> createState() =>
      _CompositedTransformFollowerWidgetState();
}

class _CompositedTransformFollowerWidgetState
    extends State<CompositedTransformFollowerWidget> {
  final _link = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 50,
      itemBuilder: (_, index) {
        dynamic link;
        if (_link.containsKey(index)) {
          link = _link[index];
        } else {
          link = LayerLink();
          _link[index] = link;
        }
        return Container(
          color: Colors.primaries[index % 18][200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CompositedTransformTarget(
                link: link,
                child: Text('This is item $index index'),
              ),
              ElevatedButton(
                child: const Icon(Icons.more_horiz),
                onPressed: () {
                  final entry = OverlayEntry(
                    builder: (_) {
                      return CompositedTransformFollower(
                        // 追随者
                        offset: Offset(20, 20), // 位移
                        showWhenUnlinked: false, // 当目标消失时自动隐藏
                        link: link,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      );
                    },
                  );
                  Overlay.of(context)?.insert(entry);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
