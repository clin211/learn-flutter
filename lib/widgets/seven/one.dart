import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  Color color = Colors.red;
  double width = 200;
  bool _round = false;
  bool _shrink = false;
  bool _show = true;

  randomColor() {
    setState(() {
      color = Color.fromARGB(
        255,
        Random.secure().nextInt(255),
        Random.secure().nextInt(255),
        Random.secure().nextInt(255),
      );
      width = Random.secure().nextInt(300).toDouble();
    });
    print('color is 👉 $color');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            '改变宽度和背景色',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ),
        Center(
          child: Container(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              width: width,
              height: 200,
              color: color,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: randomColor,
          child: const Text('AnimatedContainer'),
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            '动态改变圆角',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ),
        Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(_round ? 100 : 0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(
              () {
                _round = !_round;
              },
            );
          },
          child: const Text('change border radius'),
        ),
        const SizedBox(height: 20),
        const Text('animated padding widget'),
        AnimatedPadding(
          padding: EdgeInsets.only(left: _shrink ? 0.0 : 32.0),
          duration: const Duration(milliseconds: 200),
          child: const FlutterLogo(
            size: 70.0,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(
              () {
                _shrink = !_shrink;
              },
            );
          },
          child: const Text('change padding'),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
          child: Column(
            children: [
              const Text('AnimatedAlign widget'),
              AnimatedAlign(
                duration: const Duration(milliseconds: 500),
                alignment: _shrink ? Alignment.center : Alignment.bottomRight,
                child: FlutterLogo(
                  size: 100.0,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      _shrink = !_shrink;
                    },
                  );
                },
                child: const Text('change alignment'),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          child: Column(
            children: [
              AnimatedOpacity(
                opacity: _show ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: const FlutterLogo(size: 100.0),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      _show = !_show;
                    },
                  );
                },
                child: const Text('change opacity'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
