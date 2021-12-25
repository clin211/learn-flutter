import 'package:dio/dio.dart';
import 'package:request/utils/request/http_exception.dart';
import 'package:request/utils/request/parse_exception.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    HttpException httpException = parseException(err);
    handler.resolve(Response(
        requestOptions: err.requestOptions,
        statusCode: httpException.code,
        data: {
          'code': httpException.code,
          'message': httpException.message,
        }));
    // super.onError(err, handler);
  }
}
