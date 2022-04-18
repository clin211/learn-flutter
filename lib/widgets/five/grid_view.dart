import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  GridViewWidget({Key? key}) : super(key: key);

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GridView.count(
          crossAxisCount: 4,
          children: List.generate(
            23,
            (index) => Container(
              color: Colors.grey[index % 6 * 100],
              alignment: Alignment.center,
              child: Text('$index'),
            ),
          ),
        )
      ],
    );
  }
}
