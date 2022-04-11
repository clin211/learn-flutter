import 'package:flutter/material.dart';

class Colorful extends StatefulWidget {
  Colorful({Key? key}) : super(key: key);

  @override
  State<Colorful> createState() => _ColorfulState();
}

class _ColorfulState extends State<Colorful>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: ColorTween(
        begin: Colors.red,
        end: Colors.blue,
      ).animate(_controller),
    );
  }
}
