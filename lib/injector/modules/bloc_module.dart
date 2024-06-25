import 'package:get_it/get_it.dart';

import '../../features/app/presentation/bloc/app_bloc.dart';
import '../../features/app_director/presentation/bloc/app_director_bloc.dart';
import '../../features/table_service/presentation/bloc/table_service/table_service_bloc.dart';
import '../../features/table_service_order_item/presentation/bloc/table_service_order_item/table_service_order_item_bloc.dart';
import '../injector.dart';

class BlocModule {
  const BlocModule._();

  static final GetIt _injector = Injector.instance;

  static void setup() {
    _injector
      ..registerLazySingleton<AppBloc>(
        () => AppBloc(
          appService: _injector(),
          logService: _injector(),
          cacheClientService: _injector(),
          getAppDataUseCase: _injector(),
        ),
      )
      ..registerFactory<AppDirectorBloc>(
        () => AppDirectorBloc(
          appService: _injector(),
          cacheClientService: _injector(),
        ),
      )
      ..registerFactory<TableServiceBloc>(
        () => TableServiceBloc(
          databaseService: _injector(),
        ),
      )
      ..registerFactory<TableServiceOrderItemBloc>(
            () => TableServiceOrderItemBloc(
          databaseService: _injector(),
        ),
      );

  }
}
