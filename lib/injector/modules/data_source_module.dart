import 'package:get_it/get_it.dart';
import '../../data/app_data/data_sources/remote/app_data_remote_data_source.dart';
import '../../data/app_data/data_sources/remote/impl/app_data_remote_data_source_impl.dart';
import '../injector.dart';
import 'dio_module.dart';

class DatasourceModule {
  DatasourceModule._();

  static final GetIt _injector = Injector.instance;

  static void setup() {
    _injector.registerFactory<AppDataRemoteDataSource>(
      () => AppDataRemoteDataSourceImpl(
        dio: _injector(instanceName: DioModule.dioInstanceName),
      ),
    );
  }
}
