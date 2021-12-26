import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class BaseProvider {
  BaseProvider();

  static final BaseProvider db = BaseProvider();

  late Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
    }
    return _database;
  }

  initDB() async {
    // 判断路径是否存在，不存在需要创建
    String path = '';
    // 根据不同的场景：public user....
  }
}
