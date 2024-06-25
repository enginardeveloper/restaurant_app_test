import 'package:get_it/get_it.dart';
import '../../data/app_data/repositories/app_data_repository.dart';
import '../../data/app_data/repositories/impl/app_data_repository_impl.dart';
import '../injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static final GetIt _injector = Injector.instance;

  static void setup() {
    _injector
      .registerSingleton<AppDataRepository>(
        AppDataRepositoryImpl(
          appDataRemoteDataSource: _injector(),
        ),
      );
  }
}
