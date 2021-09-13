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

class WetherAPI {
  late Dio _dio;

  WetherAPI() {
    var options = BaseOptions(
      baseUrl: "https://opendata.cwb.gov.tw/api/v1/rest/datastore",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    var dio = Dio(options);

    dio.interceptors.add(AuthInterceptor());

    this._dio = dio;
  }

  Future<Map<String, dynamic>> fetch(String service,
      {Map<String, dynamic>? parameters}) async {
    try {
      var res = await _dio.get(service, queryParameters: parameters);
      return res.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
}
