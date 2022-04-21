import 'package:flutter/material.dart';

class DragDemo extends StatefulWidget {
  DragDemo({Key? key}) : super(key: key);

  @override
  State<DragDemo> createState() => _DragDemoState();
}

class _DragDemoState extends State<DragDemo> {
  @override
  Widget build(BuildContext context) {
    double _left = 20.0;
    double _top = 20.0;

    double _initialSize = 200.0;
    double _size = 200.0;
    double _initialAngle = 0.0;
    double _angle = 0.0;

    double x = 0.0, y = 0.0;
    int _upCount = 0;
    int _downCount = 0;
    double _offset_x = 0.0, _offset_y = 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag demo'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
                _top += details.delta.dy;
                if (_left < 0) _left = 0;
                if (_top < 0) _top = 0;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: _left, top: _top),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
          GestureDetector(
            onScaleStart: (_) {
              _initialSize = _size;
              _initialAngle = _angle;
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                _size = _initialSize * details.scale;
                _angle = _initialAngle + details.rotation;
              });
            },
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: _angle,
                child: Icon(
                  Icons.cloud,
                  size: _size,
                ),
              ),
            ),
          ),
          Listener(
            onPointerDown: (_) {
              setState(() {
                _downCount++;
              });
            },
            onPointerMove: (PointerMoveEvent details) {
              setState(() {
                x = details.position.dx;
                y = details.position.dy;
              });
            },
            onPointerUp: (_) => setState(() => _upCount++),
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '按下次数: $_downCount\n抬起次数: $_upCount',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Draggable(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            feedback: Container(
              width: 100,
              height: 100,
              color: Colors.blue[300],
            ),
            onDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _offset_x += details.delta.dx;
                _offset_y += details.delta.dy;
                if (_offset_x < 0) _offset_x = 0;
                if (_offset_y < 0) _offset_y = 0;
              });
              print('on drag update details is 👉 $details');
            },
            dragAnchorStrategy: childDragAnchorStrategy,
          )
        ],
      ),
    );
  }
}
