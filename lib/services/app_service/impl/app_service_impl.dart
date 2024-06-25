import '../../../app_config/app_config.dart';
import '../../../core/constants/app_keys/app_keys.dart';
import '../../shared_preferences_storage_service/shared_preferences_storage_service.dart';
import '../app_service.dart';

class AppServiceImpl implements AppService {
  late final SharedPreferencesStorageService _sharedPreferencesStorageService;

  AppServiceImpl({
    required SharedPreferencesStorageService sharedPreferencesStorageService,
  }) : _sharedPreferencesStorageService = sharedPreferencesStorageService;

  @override
  String get locale =>
      _sharedPreferencesStorageService.getString(key: AppKeys.localeKey) ??
      AppConfig.defaultLocale;

  @override
  bool get isFirstUse =>
      _sharedPreferencesStorageService.getBool(key: AppKeys.isFirstUseKey) ??
      true;

  @override
  String get appVersion =>
      _sharedPreferencesStorageService.getString(key: AppKeys.appVersionKey) ??
      '';

  @override
  String get buildNumber =>
      _sharedPreferencesStorageService.getString(key: AppKeys.buildNumberKey) ??
      '';

  @override
  Future<void> setIsFirstUse({required bool isFirstUse}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.isFirstUseKey,
      value: isFirstUse,
    );
  }

  @override
  Future<void> setAppVersion({required String appVersion}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.appVersionKey,
      value: appVersion,
    );
  }

  @override
  Future<void> setBuildNumber({required String buildNumber}) async {
    await _sharedPreferencesStorageService.setValue(
      key: AppKeys.buildNumberKey,
      value: buildNumber,
    );
  }
}
