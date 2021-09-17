import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final _authorization = "CWB-EF74EB83-4EB4-45C8-99BC-D9960CF17698";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var params = options.queryParameters = Map.from(options.queryParameters);

    if (params['Authorization'] == null) {
      params['Authorization'] = _authorization;
    }

    options.queryParameters = params;

    // print("[PATH] => ${options.uri}");

    return super.onRequest(options, handler);
  }
}
