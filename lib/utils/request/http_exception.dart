// 基类
class HttpException implements Exception {
  final String? _message;
  final int? _code;

  // 方括号的意思是接受的可选参数，有位置的限制
  HttpException([this._message, this._code]);

  String get message => _message ?? runtimeType.toString();
  int get code => _code ?? -1;
}

class BadRequestException extends HttpException {
  // message 与 code需要在设置的时候传递属性名
  // message 与 code不是必传参数
  BadRequestException({String? message, int? code}) : super(message, code);
}

class BadServiceException extends HttpException {
  BadServiceException({String? message, int? code}) : super(message, code);
}

class UnknownException extends HttpException {
  UnknownException({String? message, int? code}) : super(message);
}

class CancelException extends HttpException {
  CancelException({String? message, int? code}) : super(message);
}

class NetWorkException extends HttpException {
  NetWorkException({String? message, int? code}) : super(message, code);
}

class UnauthorizedException extends HttpException {
  UnauthorizedException({String? message, int? code}) : super(message, 401);
}

class BadResponseException extends HttpException {
  BadResponseException({String? message, int? code}) : super(message, code);
}
