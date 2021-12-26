import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FluroRouter>(FluroRouter());
}
