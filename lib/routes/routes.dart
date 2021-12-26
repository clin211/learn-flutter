import 'package:fluro/fluro.dart';
import 'package:route/pages/detail.dart';
import 'package:route/pages/home.dart';
import 'package:route/pages/login.dart';

class Routes {
  // 1、页面路径的定义
  static String home = '/';
  static String login = '/login';
  static String detail = '/detail/:id';

  // 2、定义路径的handler
  static final Handler _homeHandler = Handler(
    handlerFunc: (context, parameters) {
      return Home();
    },
  );
  static final Handler _loginHandler = Handler(
    handlerFunc: (context, parameters) {
      return const Login();
    },
  );
  static final Handler _detailHandler = Handler(
    handlerFunc: (context, parameters) {
      print(
          '🚀 ~ file: routes.dart ~ line 25 ~ Routes ~ parameters: $parameters');
      return const Detail();
    },
  );

  // 3、定义configureRoute -> 用于生产页面的路由
  static void configereRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(
      login,
      handler: _loginHandler,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      detail,
      handler: _detailHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
