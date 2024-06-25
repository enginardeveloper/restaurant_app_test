import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/failure/failure.dart';
import '../../../../services/app_service/app_service.dart';
import '../../../../services/cache_client_service/cache_client_service.dart';

part 'app_director_event.dart';

part 'app_director_state.dart';

class AppDirectorBloc extends Bloc<AppDirectorEvent, AppDirectorState> {
  final CacheClientService _cacheClientService;
  final AppService _appService;

  AppDirectorBloc({
    required CacheClientService cacheClientService,
    required AppService appService,
  })  : _cacheClientService = cacheClientService,
        _appService = appService,

        super(
          const AppDirectorState(
          ),
        ) {
    on<AppDirectorEventFetched>(_onAppDirectorEventFetched);
    on<AppDirectorEventFirstUseDisabled>(_onAppDirectorEventFirstUseDisabled);
  }

  _onAppDirectorEventFirstUseDisabled(AppDirectorEventFirstUseDisabled event,
      Emitter<AppDirectorState> emit) async {
    if (state.isFirstUse) {
      emit(
        state.copyWith(
          appDirectorStatus: AppDirectorStatus.loading,
        ),
      );
      await _appService.setIsFirstUse(isFirstUse: false);
      emit(
        state.copyWith(
          isFirstUse: false,
          appDirectorStatus: AppDirectorStatus.success,
        ),
      );
    }
  }

  _onAppDirectorEventFetched(
      AppDirectorEventFetched event, Emitter<AppDirectorState> emit) async {
    emit(
      state.copyWith(
        appDirectorStatus: AppDirectorStatus.loading,
      ),
    );
    final bool isFirstUse = _appService.isFirstUse;
    emit(
      state.copyWith(
        isFirstUse: isFirstUse,
        appDirectorStatus: AppDirectorStatus.success,
        failure: const Failure(),
      ),
    );
  }
}
