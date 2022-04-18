import 'package:flutter/material.dart';

class ScrollConfigurationWidget extends StatefulWidget {
  const ScrollConfigurationWidget({Key? key}) : super(key: key);

  @override
  State<ScrollConfigurationWidget> createState() =>
      _ScrollConfigurationWidgetState();
}

class _ScrollConfigurationWidgetState extends State<ScrollConfigurationWidget> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyScrollBehavior(),
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (s, i) => const Divider(),
        itemBuilder: (_, index) {
          return Container(
            height: 56,
            alignment: Alignment.center,
            child: Text('这是第${index + 1}项'),
          );
        },
      ),
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return GlowingOverscrollIndicator(
      child: child,
      axisDirection: axisDirection,
      color: Colors.grey,
    );
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return ClampingScrollPhysics(parent: RangeMaintainingScrollPhysics());
  }
}
