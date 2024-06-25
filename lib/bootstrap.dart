import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'core/app_bloc_observer/app_bloc_observer.dart';
import 'features/app/presentation/pages/app_page.dart';
import 'injector/injector.dart';

Future<void> bootstrap({
  AsyncCallback? firebaseInitialization,
  AsyncCallback? flavorConfiguration,
}) async {
  //await runZonedGuarded(() async {

  //
    WidgetsFlutterBinding.ensureInitialized();

    await firebaseInitialization?.call();
    Logger.level = Level.verbose;
    await flavorConfiguration?.call();

    Injector.init();

    await Injector.instance.allReady();

    Bloc.observer = AppBlocObserver();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
            (value) => runApp(
    const AppPage()));

  //}, (error, stack) {
    // Injector.instance<CrashlyticsService>().recordException(error, stack);
  //});
}