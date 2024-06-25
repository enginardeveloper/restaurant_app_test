import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../entities/app_data/app_data_entity.dart';

abstract class AppDataRepository {
  Future<Either<Failure, AppDataEntity>> getAppData(int appDataId);
}
