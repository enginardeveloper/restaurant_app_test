import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../injector.dart';

class DioModule {
  DioModule._();

  static final GetIt _injector = Injector.instance;
  static const String dioInstanceName = 'dioInstance';

  static void setup() {
    _setupDio();
  }

  /// dispose parameter
  // Sometimes we need to do some stuff like closing a stream, writing to log while unregistering, or resetting the registered instances. That can be specified in the dispose parameter.
  //
  // serviceLocator.registerSingleton(
  //          MyWebService(),
  //          dispose: (webservice) => webservice.closeConnection());

  /// why instanceName?
  /// get the second registered webservice
  // var webservice = serviceLocator
  //                  .get<MyWebService>(instanceName: 'v2');
  static void _setupDio() {
    _injector.registerLazySingleton<Dio>(instanceName: dioInstanceName, () {

      final BaseOptions options = BaseOptions(
          connectTimeout: const Duration(seconds: 20), // 60 seconds
          //receiveTimeout: 60*1000 // 60 seconds
      );
      final Dio dio = Dio(options);
      if (!kReleaseMode) {
        dio.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            request: false,
          ),
        );
      }
      return dio;
    });
  }
}