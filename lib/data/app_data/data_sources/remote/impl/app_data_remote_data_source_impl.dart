import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/constants/urls/urls.dart';
import '../../../../../core/exceptions/exceptions.dart';
import '../../../models/app_data_model.dart';
import '../app_data_remote_data_source.dart';

class AppDataRemoteDataSourceImpl implements AppDataRemoteDataSource {
  final Dio _dio;

  const AppDataRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<AppDataModel> getAppDataOpenUser(int appDataId) async {
    try {
      // final response = await _dio.get(
      //   Urls.appDataOpenUser(),
      //   queryParameters: {
      //     "appDataId": appDataId,
      //   },
      // );
      // if (response.statusCode == 200) {
      //   return AppDataModel.fromJson(response.data);
      // } else {
      //   throw RestApiException(statusCode: response.statusCode);
      // }
      Future.delayed(const Duration(milliseconds: 5));
      return AppDataModel.fromJson({
        'id': appDataId,
        'buildNumber': '2',
        'appVersion': '1.0.1',
      });
    } on DioException catch (e) {
      if ((e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout)) {
        throw const SocketException('exception_socket_message');
      } else if (e.response != null) {
        throw RestApiException(statusCode: e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
