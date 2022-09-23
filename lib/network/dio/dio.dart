import 'package:dio/dio.dart';

class dio_helper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://alcaptin.com/api/',
      receiveDataWhenStatusError: true,
    )
    );
  }
  static Future<Response> postdatalogin({
     String url='login',
    required Map<String, dynamic> data,
  }) async {
    return dio!.post(url, data: data);
  }
  static Future<Response> postdataregister({
     String url='register',
    required Map<String, dynamic> data,
  }) async {
    return dio!.post(url, data: data);
  }
}
