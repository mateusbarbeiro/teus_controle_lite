import 'package:dio/dio.dart';

const String SERVER_IP = "http://10.0.0.199:44313/";

class DioConfig {
  static Dio builderConfig() {
    var dio = Dio(
      BaseOptions(
        baseUrl: '$SERVER_IP',
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000,
      ),
    );

    return dio;
  }
}
