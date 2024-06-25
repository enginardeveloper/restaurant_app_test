import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector/injector.dart';
import '../../services/log_service/log_service.dart';

class AppBlocObserver extends BlocObserver {

  final LogService _logService;

  AppBlocObserver() : _logService = Injector.instance<LogService>();

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logService.e('Bloc: ${bloc.runtimeType}', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    _logService.i('Bloc: ${bloc.runtimeType} created');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logService.i('Bloc: ${bloc.runtimeType} Event: ${event.runtimeType} added');
    super.onEvent(bloc, event);
  }

}