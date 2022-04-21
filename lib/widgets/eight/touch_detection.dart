import 'package:flutter/material.dart';

class TouchDetection extends StatefulWidget {
  const TouchDetection({Key? key}) : super(key: key);

  @override
  State<TouchDetection> createState() => _TouchDetectionState();
}

class _TouchDetectionState extends State<TouchDetection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('GestureDetector'),
          subtitle: GestureDetector(
            onTap: () => print('onTap'),
            onLongPress: () => print('onLongPress'),
            onTapDown: (details) => print('onTapDown $details'),
            onTapUp: (details) => print('on tap up is 👉 $details'),
            onTapCancel: () => print('on tap cancel'),
            child: const FlutterLogo(
              size: 40.0,
            ),
          ),
        ),
      ],
    );
  }
}
