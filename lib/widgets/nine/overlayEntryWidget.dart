import 'package:flutter/material.dart';

class OverlayEntryWidget extends StatefulWidget {
  const OverlayEntryWidget({Key? key}) : super(key: key);

  @override
  State<OverlayEntryWidget> createState() => _OverlayEntryWidgetState();
}

class _OverlayEntryWidgetState extends State<OverlayEntryWidget> {
  OverlayEntry? entry;
  double _left = 50.0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: ElevatedButton(
            child: const Text('overlay test'),
            onPressed: () {
              entry = OverlayEntry(builder: (context) {
                return Positioned(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey,
                    ),
                    top: 100,
                    left: _left);
              });
              Overlay.of(context)?.insert(entry!);
            },
          ),
        ),
        ElevatedButton(
          child: const Text('移动'),
          onPressed: () {
            _left += 20;
            entry?.markNeedsBuild();
          },
        ),
        ElevatedButton(
          onPressed: () => entry?.remove(),
          child: const Text('移除'),
        ),
      ],
    );
  }
}
