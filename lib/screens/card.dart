import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final int id;
  const Card({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Text('card'),
    ));
  }
}
