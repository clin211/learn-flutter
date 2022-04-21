import 'package:flutter/material.dart';

class BoundariesOne extends StatefulWidget {
  BoundariesOne({Key? key}) : super(key: key);

  @override
  State<BoundariesOne> createState() => _BoundariesOneState();
}

class _BoundariesOneState extends State<BoundariesOne> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: const Padding(
            // padding: EdgeInsets.all(8.0), // 四边为8
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: FlutterLogo(),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print(' is 👉 pressed');
            Navigator.pushNamed(context, '/chapter_six/one');
          },
          child: const Text('jump to next page'),
        ),
        ListTile(
          title: const Text('纹理'),
          subtitle: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: List.generate(
                    150, (index) => index % 2 == 0 ? Colors.red : Colors.blue),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(children: [
              Flexible(
                flex: 2,
                child: Container(
                  height: 24,
                  width: 24,
                  color: Colors.grey[600],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 24,
                  width: 24,
                  color: Colors.grey[400],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 24,
                  width: 24,
                  color: Colors.grey[800],
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
