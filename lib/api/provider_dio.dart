import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio ProviderDio(){
    Dio dio =  Dio();
    dio.options.headers = {
      "X-Api-Key" :"70dc19d299854971aa07a0cbdfebe93d"};
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 140,
      enabled: kDebugMode,
    ));
    return dio;
}