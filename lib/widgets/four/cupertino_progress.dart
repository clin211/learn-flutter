import 'package:flutter/cupertino.dart';

class CupertinoProgressWidget extends StatefulWidget {
  CupertinoProgressWidget({Key? key}) : super(key: key);

  @override
  State<CupertinoProgressWidget> createState() =>
      _CupertinoProgressWidgetState();
}

class _CupertinoProgressWidgetState extends State<CupertinoProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Wrap(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const CupertinoActivityIndicator(),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const CupertinoActivityIndicator(
                animating: true,
                radius: 50,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const CupertinoActivityIndicator(),
            ),
          ],
        ),
      ],
    );
  }
}
