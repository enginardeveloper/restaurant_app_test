import '../../models/app_data_model.dart';

abstract class AppDataRemoteDataSource {
  Future<AppDataModel> getAppDataOpenUser(int appDataId);
}
