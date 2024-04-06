import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class HttpLoggingInterceptor extends Interceptor {
  Logger logger;

  HttpLoggingInterceptor({required this.logger});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      logger
          .d('---------------------------REQUEST-----------------------------\n'
              'ENDPOINT: ${options.baseUrl}${options.path}\n'
              'METHOD: ${options.method}\n'
              'DATA: ${jsonEncode(options.data)}\n'
              'HEADERS:\n${options.headers}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      logger.d(
          '---------------------------RESPONSE------------------------------\n'
          'ENDPOINT: ${response.requestOptions.baseUrl}${response.requestOptions.path}\n'
          'METHOD: ${response.requestOptions.method}\n'
          'STATUS-CODE: ${response.statusCode}\n'
          'DATA: ${jsonEncode(response.data)}\n'
          'HEADERS:\n${response.headers}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      logger.e('---------------------------ERROR-----------------------------\n'
          'ENDPOINT: ${err.requestOptions.baseUrl}${err.requestOptions.path}\n'
          'METHOD: ${err.requestOptions.method}\n'
          'STATUS-CODE: ${err.response?.statusCode}\n'
          'DATA: ${jsonEncode(err.response?.data)}\n'
          'HEADERS:\n${err.response?.headers}');
    }
    super.onError(err, handler);
  }
}
