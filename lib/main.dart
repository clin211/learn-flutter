import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:route/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1、实例化router -> FluroRouter
    FluroRouter router = FluroRouter();

    // 2、configureRoutes -> 配置路由
    Routes.configereRoutes(router);

    // 3、MaterialApp -> router.generator
    return MaterialApp(
      title: 'Flutter fluro',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.light,
      ),
      initialRoute: Routes.home,
      onGenerateRoute: router.generator,
    );
  }
}
