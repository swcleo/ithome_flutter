import 'package:dio/dio.dart';
import './interceptors/auth_interceptor.dart';

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
