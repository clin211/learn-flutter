import 'package:flutter/material.dart';

class ThreeAnimatedDemo extends StatefulWidget {
  const ThreeAnimatedDemo({Key? key}) : super(key: key);

  @override
  State<ThreeAnimatedDemo> createState() => _ThreeAnimatedDemoState();
}

class _ThreeAnimatedDemoState extends State<ThreeAnimatedDemo> {
  bool _showFirst = true;
  @override
  Widget build(BuildContext context) {
    final box1 = Container(
      key: UniqueKey(),
      width: 100,
      height: 50,
      color: Colors.black,
    );

    final box2 = Container(
      key: UniqueKey(),
      width: 80,
      height: 50,
      color: Colors.grey,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'AnimatedSwitcher',
              style: TextStyle(fontSize: 20),
            ),
            AnimatedSwitcher(
              duration: const Duration(seconds: 5),
              child: _showFirst ? box1 : box2,
            ),
            Flexible(
              child: ElevatedButton(
                child: Text('swap'),
                onPressed: () => setState(() => _showFirst = !_showFirst),
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('AnimatedCrossFade', style: TextStyle(fontSize: 20)),
            AnimatedCrossFade(
              firstChild: box1,
              secondChild: box2,
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(seconds: 5),
            ),
            Flexible(
              child: ElevatedButton(
                child: Text('swap'),
                onPressed: () => setState(
                  () {
                    _showFirst = !_showFirst;
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
