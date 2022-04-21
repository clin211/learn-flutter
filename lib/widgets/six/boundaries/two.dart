import 'package:flutter/material.dart';

class BoundariesTwo extends StatefulWidget {
  BoundariesTwo({Key? key}) : super(key: key);

  @override
  State<BoundariesTwo> createState() => _BoundariesTwoState();
}

class _BoundariesTwoState extends State<BoundariesTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemBuilder: (s, i) => const Text(
          "This is  a text",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
