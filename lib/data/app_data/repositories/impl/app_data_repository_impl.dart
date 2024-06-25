import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/failure/failure.dart';
import '../../../../entities/app_data/app_data_entity.dart';
import '../../data_sources/remote/app_data_remote_data_source.dart';
import '../app_data_repository.dart';

class AppDataRepositoryImpl implements AppDataRepository {
  final AppDataRemoteDataSource _appDataRemoteDataSource;

  const AppDataRepositoryImpl(
      {required AppDataRemoteDataSource appDataRemoteDataSource})
      : _appDataRemoteDataSource = appDataRemoteDataSource;

  @override
  Future<Either<Failure, AppDataEntity>> getAppData(int appDataId) async {
    try {
      final response = await _appDataRemoteDataSource.getAppDataOpenUser(appDataId);
      AppDataEntity appDataEntity = response.toEntity();
      return Right(appDataEntity);
    } on RestApiException {
      return const Left(Failure(
          message: 'server_error_please_try_again',
          status: FailureStatus.serverFailure));
    } on SocketException {
      return const Left(Failure(
          message: 'internet_connection_failure',
          status: FailureStatus.connectionFailure));
    }
  }
}
