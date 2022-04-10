import 'package:flutter/material.dart';

class ChapterOne extends StatefulWidget {
  const ChapterOne({Key? key}) : super(key: key);

  @override
  State<ChapterOne> createState() => _ChapterOneState();
}

class _ChapterOneState extends State<ChapterOne> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Go back'),
      ),
    );
  }
}
