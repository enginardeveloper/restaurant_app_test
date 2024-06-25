abstract class FirebaseCrashlyticsService {
  Future<void> init();
  Future<void> recordException(dynamic exception, StackTrace? stack);
}