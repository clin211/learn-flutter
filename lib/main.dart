import 'package:flutter/material.dart';
import 'package:yiyan/ui/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkModeOn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            const Home(),
            Positioned(
              right: 20,
              top: 40,
              child: SizedBox(
                width: 30,
                height: 30,
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  child: Icon(
                      darkModeOn ? Icons.dark_mode_outlined : Icons.dark_mode,
                      size: 25),
                  onPressed: () {
                    setState(() {
                      darkModeOn = !darkModeOn;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
