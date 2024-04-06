import 'package:dio/dio.dart';
import 'package:fake_api_exam/core/const/key_const.dart';
import 'package:fake_api_exam/core/network/http_logging_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  Dio dio;
  HttpLoggingInterceptor loggingInterceptor;

  DioClient({
    required this.dio,
    required this.loggingInterceptor,
  }) {
    String baseUrl = dotenv.get(
      KeyConst.baseUrl,
      fallback: 'Undefined Base URL',
    );

    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
    );

    dio = Dio(options);
    dio.interceptors.add(loggingInterceptor);
  }

  Dio getDio() {
    return dio;
  }
}
