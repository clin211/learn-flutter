import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  bool _loading = true;

  Future<void> _toggleLoading() async {
    await Duration(seconds: 1);
    setState(() {
      _loading = !_loading;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _toggleLoading();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: _loading
              ? const CircularProgressIndicator(
                  strokeWidth: 1,
                  color: Colors.deepOrange,
                )
              : const Text('加载完成'),
        ),
        const Text('animated switcher'),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _loading ? const Text('加载中') : const Text('加载完成'),
          transitionBuilder: (child, animation) {
            return RotationTransition(turns: animation, child: child);
          },
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
            });
          },
          child: const Text('change loading'),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _loading ? const Text('加载中') : const Text('加载完成'),
              transitionBuilder: (child, animation) {
                return RotationTransition(turns: animation, child: child);
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _loading = !_loading;
                  });
                },
                child: const Text('change loading'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
