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

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool darkModeOn = false;
  bool customTheme = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    Brightness brightness = WidgetsBinding.instance.window.platformBrightness;
    setState(() {
      if (brightness.name == "light") {
        darkModeOn = false;
      } else {
        darkModeOn = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: customTheme && !darkModeOn
              ? Brightness.light
              : customTheme && darkModeOn
                  ? Brightness.dark
                  : Brightness.light),
      darkTheme: ThemeData(
        brightness: customTheme && !darkModeOn
            ? Brightness.light
            : customTheme && darkModeOn
                ? Brightness.dark
                : Brightness.dark,
      ),
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
                      customTheme = true;
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
