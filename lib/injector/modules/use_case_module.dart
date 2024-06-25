import 'package:get_it/get_it.dart';

import '../../features/app/use_cases/get_app_data_use_case.dart';
import '../injector.dart';

class UseCaseModule {
  UseCaseModule._();

  static final GetIt _injector = Injector.instance;

  static void setup() {
    _injector
      .registerSingleton<GetAppDataUseCase>(
        GetAppDataUseCase(
          appDataRepository: _injector(),
        ),
      );
  }
}
