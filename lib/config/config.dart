enum Env {
  Dev,
  Prod,
}

class Config {
  // static const String baseUrl = 'https://picsum.photos';
  static const String baseUrl = 'http://jsonplaceholder.typicode.com';

// 配置环境
  static const Env env = Env.Prod;
}
