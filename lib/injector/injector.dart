import 'package:get_it/get_it.dart';
import 'modules/bloc_module.dart';
import 'modules/data_source_module.dart';
import 'modules/dio_module.dart';
import 'modules/repository_module.dart';
import 'modules/service_module.dart';
import 'modules/use_case_module.dart';

// final locator = GetIt.instance;

class Injector {
  Injector._();

  static GetIt instance = GetIt.instance;

  static void init() {
    DioModule.setup();
    ServiceModule.init();
    DatasourceModule.setup();
    RepositoryModule.setup();
    UseCaseModule.setup();
    BlocModule.setup();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}
