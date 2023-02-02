import 'package:flutter/material.dart';

class VerticalText extends StatefulWidget {
  const VerticalText(
      {Key? key,
      required this.textContent,
      required this.from,
      required this.numberOfSingleLineText,
      required this.singleLineWidth})
      : super(key: key);
  final String textContent;
  final String from;
  final int numberOfSingleLineText;
  final double singleLineWidth;
  @override
  VerticalTextState createState() => VerticalTextState();
}

class VerticalTextState extends State<VerticalText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int numberOfLines =
        widget.textContent.length ~/ widget.numberOfSingleLineText;
    if (widget.textContent.length % widget.numberOfSingleLineText > 0) {
      numberOfLines++;
    }
    List<Widget> allTextLine = [];
    for (int i = 0; i < numberOfLines; i++) {
      String singleLineText = '';
      singleLineText = widget.textContent.substring(
          widget.numberOfSingleLineText * i,
          i < numberOfLines - 1
              ? widget.numberOfSingleLineText * (i + 1)
              : widget.textContent.length);
      allTextLine.add(
        Container(
          margin: const EdgeInsets.only(left: 5),
          width: widget.singleLineWidth,
          child: Text(
            singleLineText,
            style: TextStyle(fontSize: widget.singleLineWidth + 1),
            textAlign: TextAlign.left,
          ),
        ),
      );
    }
    for (int i = 0; i < allTextLine.length / 2; i++) {
      Widget temp = allTextLine[i];
      allTextLine[i] = allTextLine[allTextLine.length - 1 - i];
      allTextLine[allTextLine.length - 1 - i] = temp;
    }
    String from = widget.from;
    // return Column(
    //   children: [
    //     Container(
    //       padding: const EdgeInsets.only(top: 40, bottom: 30),
    //       child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: allTextLine),
    //     ),
    //     Text(
    //       '- $from -',
    //       style: TextStyle(fontSize: widget.numberOfSingleLineText + 1),
    //     )
    //   ],
    // );
    return AnimatedScale(
      duration: const Duration(milliseconds: 2000),
      scale: widget.textContent != '' ? 1.0 : 0.0,
      child: AnimatedRotation(
        turns: widget.textContent != '' ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 2000),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40, bottom: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: allTextLine),
            ),
            Text(
              '- $from -',
              style: TextStyle(fontSize: widget.numberOfSingleLineText + 1),
            )
          ],
        ),
      ),
    );
  }
}
