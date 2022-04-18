import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  get label => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 6,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.star_border),
              label: const Text(''),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.star_border),
              label: const Text('star'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.star_border),
              label: const Text('star'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.star_border),
              label: const Text('star'),
            ),
          ],
        ),
        // ListWheelScrollView(
        //   itemExtent: 30,
        //   diameterRatio: 2.0,
        //   children: [
        //     Container(
        //       height: 90,
        //       alignment: Alignment.center,
        //       color: Colors.grey,
        //       child: const Text('one'),
        //     ),
        //     Container(
        //       height: 230,
        //       alignment: Alignment.center,
        //       color: Colors.grey,
        //       child: const Text('two'),
        //     ),
        //     Container(
        //       height: 110,
        //       alignment: Alignment.center,
        //       color: Colors.grey,
        //       child: const Text('three'),
        //     ),
        //     Container(
        //       height: 60,
        //       alignment: Alignment.center,
        //       color: Colors.grey,
        //       child: const Text('four'),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
