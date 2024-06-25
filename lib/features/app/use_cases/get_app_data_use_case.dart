import 'dart:async';

import 'package:dartz/dartz.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/failure/failure.dart';
import '../../../data/app_data/repositories/app_data_repository.dart';
import '../../../entities/app_data/app_data_entity.dart';
import 'get_app_data_params.dart';

class GetAppDataUseCase implements BaseUseCase<AppDataEntity, GetAppDataParams> {

  final AppDataRepository _appDataRepository;

  const GetAppDataUseCase(
  {required AppDataRepository appDataRepository}

      ) : _appDataRepository = appDataRepository;

  @override
  FutureOr<Either<Failure, AppDataEntity>> call(GetAppDataParams getAppDataParams) {
    return _appDataRepository.getAppData(getAppDataParams.appDataId);
  }

}

