import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../hive/hive.dart';
import '../injection/injection.dart';
import 'api.dart';

@singleton
class RestClientFactory {
  HiveStorage hiveService = getIt<HiveStorage>();

  Dio obtainTokenDio() {
    final dio = Dio();
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
          responseBody: true,
          logPrint: (data) {
            log("Api Response: $data");
          }));
    }

    return dio;
  }

  Dio obtainDio() {
    final dio = Dio();
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
          responseBody: true,
          logPrint: (data) {
            log("Api Response: $data");
          }));
    }

    return dio;
  }

  TokenRestClient obtainTokenRestClient() {
    return TokenRestClient(obtainTokenDio(), baseUrl: '');
  }

  RestClient obtainRestClient() {
    return RestClient(obtainDio(), baseUrl: '');
  }
}
