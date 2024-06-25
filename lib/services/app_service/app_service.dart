abstract class AppService {
  bool get isFirstUse;

  String get appVersion;

  String get buildNumber;

  Future<void> setIsFirstUse({required bool isFirstUse});

  Future<void> setAppVersion({required String appVersion});

  Future<void> setBuildNumber({required String buildNumber});
}
