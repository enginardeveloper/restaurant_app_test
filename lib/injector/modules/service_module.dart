import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/app_service/app_service.dart';
import '../../services/app_service/impl/app_service_impl.dart';
import '../../services/cache_client_service/cache_client_service.dart';
import '../../services/cache_client_service/impl/cache_client_service_impl.dart';
import '../../services/database_service/database_service.dart';
import '../../services/database_service/impl/database_service_impl.dart';
import '../../services/firebase_crashlytics_service/firebase_crashlytics_service.dart';
import '../../services/firebase_crashlytics_service/impl/firebase_crashlytics_service_impl.dart';
import '../../services/log_service/impl/debug_log_service_impl.dart';
import '../../services/log_service/log_service.dart';
import '../../services/shared_preferences_storage_service/impl/shared_preferences_storage_service_impl.dart';
import '../../services/shared_preferences_storage_service/shared_preferences_storage_service.dart';
import '../injector.dart';

class ServiceModule {
  const ServiceModule._();

  static final GetIt _injector = Injector.instance;

  static void init() {
    _injector
      ..registerSingletonAsync<FirebaseCrashlyticsService>(() async {
        return FirebaseCrashlyticsServiceImpl();
      })
      ///.new is to pass a reference to the constructor.
      /// It doesn't create a new class. It's just the same default constructor of the class.
      /// This is also called a constructor tear-off.
      ..registerFactory<LogService>(DebugLogServiceImpl.new)
      ..registerSingleton<SharedPreferencesStorageService>(
        SharedPreferencesStorageServiceImpl(
          logService: _injector(),
        ),
        /// when you create a singleton with async creation function you signal that the singleton is ready within the constructor
        signalsReady: true,
      )
      ..registerSingleton<DatabaseService>(
        DatabaseServiceImpl(
          logService: _injector(),
        ),
        signalsReady: true,
      )
      ..registerSingleton<AppService>(AppServiceImpl(sharedPreferencesStorageService: _injector()))
      ..registerSingleton<CacheClientService>(CacheClientServiceImpl());
  }
}


