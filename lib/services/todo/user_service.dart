import 'package:request/utils/request/dio_http.dart';

class UserService {
  Future sendCode(String uerid) async {
    var params = {
      'uerid': uerid,
    };
    return await DioHttp().get('/todos', params);
  }
}
