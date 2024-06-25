import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/constants/cache_client_keys/cache_client_keys.dart';
import '../../../../core/failure/failure.dart';
import '../../../../entities/app_data/app_data_entity.dart';
import '../../../../services/app_service/app_service.dart';
import '../../../../services/cache_client_service/cache_client_service.dart';
import '../../../../services/log_service/log_service.dart';
import '../../use_cases/get_app_data_params.dart';
import '../../use_cases/get_app_data_use_case.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppService _appService;
  final LogService _logService;
  final CacheClientService _cacheClientService;
  final GetAppDataUseCase _getAppDataUseCase;

  AppBloc({
    required AppService appService,
    required LogService logService,
    required CacheClientService cacheClientService,
    required GetAppDataUseCase getAppDataUseCase,
  })  : _logService = logService,
        _appService = appService,
        _getAppDataUseCase = getAppDataUseCase,
        _cacheClientService = cacheClientService,
        super(const AppState.authenticated()) {
    on<AppEventLoaded>(_onAppEventLoaded);
  }

  _onAppEventLoaded(AppEventLoaded event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(appStatus: AppStatus.loading));
      int appDataId = Platform.isIOS ? 1 : 2;
      Either<Failure, AppDataEntity> result =
          await _getAppDataUseCase(GetAppDataParams(appDataId: appDataId));

      await result.fold(
        (failure) {
          emit(
            state.copyWith(
              appStatus: AppStatus.failure,
              failure: Failure(
                message: failure.message,
                status: failure.status,
              ),
            ),
          );
        },
        (data) async {
          await Future.wait([
            _appService.setAppVersion(appVersion: data.appVersion),
            _appService.setBuildNumber(buildNumber: data.buildNumber),
            /// whenComplete runs regardless of the future completed with a value or with an error like FINALLY
          ]).then(
            (value) {
              emit(
                state.copyWith(
                  appStatus: AppStatus.success,
                  failure: const Failure(),
                ),
              );
            },
            /// onError
            /// Register the optional onError callback only if you want to differentiate between an error forwarded to then(), and an error generated within then():
            //   onError: (e) {
            //     handleError(e); // Original error.
            //     anotherAsyncErrorFunction(); // Oops, new error.
            //   }).catchError(handleError);
          ).catchError((error, stackTrace) {
            _logService.e('AppBloc1 load failed', error, stackTrace);
            emit(
              state.copyWith(
                appStatus: AppStatus.failure,
                failure: const Failure(
                    status: FailureStatus.none,
                    message: 'failure_app_data_load'),
              ),
            );
          });
        },
      );
    } catch (error, stackTrace) {
      _logService.e('AppBloc2 load failed', error, stackTrace);
      emit(
        state.copyWith(
          appStatus: AppStatus.failure,
          failure:
              Failure(status: FailureStatus.none, message: error.toString()),
        ),
      );
    }
  }

}
