import 'package:dio/dio.dart';
import 'package:fake_api_exam/core/const/key_const.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    String baseUrl = dotenv.get(
      KeyConst.baseUrl,
      fallback: 'Undefined Base URL',
    );

    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
    );

    _dio = Dio(options);
  }

  Dio getDio() {
    return _dio;
  }
}
