import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    BaseOptions options = BaseOptions();

    _dio = Dio(options);
  }
}
