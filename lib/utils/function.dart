import 'dart:io';

import 'package:path/path.dart';

// 递归创建目录
makeDir(String path) async {
  // 路径存在返回true 否则返回false
  if (await Directory(dirname(path)).exists()) {
    return true;
  } else {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
      return false;
    }
    return true;
  }
}
