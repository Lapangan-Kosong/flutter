import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('${options.path} => uri ${options.uri}');
    debugPrint('${options.path} => headers ${options.headers}');
    debugPrint('${options.path} => param ${options.queryParameters}');
    debugPrint('${options.path} => body ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('${err.requestOptions.path} => error $err');
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('${response.requestOptions.path} => sc ${response.statusCode}');
    debugPrint('${response.requestOptions.path} => response ${response.data}');
    super.onResponse(response, handler);
  }
}
